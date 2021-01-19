
# resource "oci_core_instance" "ol8-instance-01" {
#     # Required
#     availability_domain = data.oci_identity_availability_domains.ads.availability_domains[0].name
#     compartment_id = oci_identity_compartment.tf-compartment.id
#     shape = var.compute_shape
#     source_details {
#         source_id = var.compute_source_id
#         source_type = "image"
#     }

#     # Optional
#     display_name = var.compute_display_name-01
#     create_vnic_details {
#         assign_public_ip = true
#         subnet_id = oci_core_subnet.vcn-public-subnet.id
#     }
#     metadata = {
#         ssh_authorized_keys = file(var.compute_ssh_authorized_keys)
#     } 
#     preserve_boot_volume = false
# }


# resource "oci_core_instance" "ol8-instance-02" {
#     # Required
#     availability_domain = data.oci_identity_availability_domains.ads.availability_domains[0].name
#     compartment_id = oci_identity_compartment.tf-compartment.id
#     shape = var.compute_shape
#     source_details {
#         source_id = var.compute_source_id
#         source_type = "image"
#     }

#     # Optional
#     display_name = var.compute_display_name-02
#     create_vnic_details {
#         assign_public_ip = false
#         subnet_id = oci_core_subnet.vcn-private-subnet.id
#     }
#     metadata = {
#         ssh_authorized_keys = file(var.compute_ssh_authorized_keys)
#     } 
#     preserve_boot_volume = false

# }


data "oci_core_app_catalog_listings" "test_app_catalog_listings" {
  /*filter {
    name   = "publisher_name"
    values = ["OpenVPN Access Server"]
  }*/
}

data "oci_core_app_catalog_listing_resource_versions" "test_app_catalog_listing_resource_versions" {
  #Required
  listing_id = data.oci_core_app_catalog_listings.test_app_catalog_listings.app_catalog_listings[0]["listing_id"]
}

resource "oci_core_app_catalog_listing_resource_version_agreement" "test_app_catalog_listing_resource_version_agreement" {
  #Required
  listing_id               = data.oci_core_app_catalog_listing_resource_versions.test_app_catalog_listing_resource_versions.app_catalog_listing_resource_versions[0]["listing_id"]
  listing_resource_version = data.oci_core_app_catalog_listing_resource_versions.test_app_catalog_listing_resource_versions.app_catalog_listing_resource_versions[0]["listing_resource_version"]
}

resource "oci_core_app_catalog_subscription" "test_app_catalog_subscription" {
  compartment_id           = oci_identity_compartment.tf-compartment.id
  eula_link                = oci_core_app_catalog_listing_resource_version_agreement.test_app_catalog_listing_resource_version_agreement.eula_link
  listing_id               = oci_core_app_catalog_listing_resource_version_agreement.test_app_catalog_listing_resource_version_agreement.listing_id
  listing_resource_version = oci_core_app_catalog_listing_resource_version_agreement.test_app_catalog_listing_resource_version_agreement.listing_resource_version
  oracle_terms_of_use_link = oci_core_app_catalog_listing_resource_version_agreement.test_app_catalog_listing_resource_version_agreement.oracle_terms_of_use_link
  signature                = oci_core_app_catalog_listing_resource_version_agreement.test_app_catalog_listing_resource_version_agreement.signature
  time_retrieved           = oci_core_app_catalog_listing_resource_version_agreement.test_app_catalog_listing_resource_version_agreement.time_retrieved

  timeouts {
    create = "20m"
  }
}


# bootstrap data source
data "template_file" "bootstrap" {
template = base64encode(file("./userdata/bootstrap.tpl"))

  vars = {
    password          = "EE1a2qfRs0FR"
    as_activation_key = ""
    admin_username    = "openvpnadmin"
  }
}


resource "oci_core_instance" "as_instance" {
  availability_domain = data.oci_identity_availability_domains.ads.availability_domains[0].name
  compartment_id      = oci_identity_compartment.tf-compartment.id
  display_name        = "OpenVPN Access Server"
  shape               = var.compute_shape

  availability_config {
	recovery_action = "RESTORE_INSTANCE"
	}

  create_vnic_details {
    subnet_id        = oci_core_subnet.vcn-public-subnet.id
  }

  source_details {
    source_type = "image"
    source_id   = data.oci_core_app_catalog_subscriptions.test_app_catalog_subscriptions.app_catalog_subscriptions[0]["listing_resource_id"]
  }

  metadata = {
    ssh_authorized_keys = file(var.compute_ssh_authorized_keys)
    user_data           = base64encode(data.template_file.bootstrap.rendered)


  }

  timeouts {
    create = "60m"
  }
}

# Gets a list of VNIC attachments on the instance
data "oci_core_vnic_attachments" "instance_vnics" {
  availability_domain = data.oci_identity_availability_domains.ads.availability_domains[0].name
  compartment_id      = oci_identity_compartment.tf-compartment.id
  instance_id         = oci_core_instance.as_instance.id
}

# Gets the OCID of the first VNIC
data "oci_core_vnic" "instance_vnic1" {
  vnic_id = lookup(data.oci_core_vnic_attachments.instance_vnics.vnic_attachments[0], "vnic_id")
}


# Gets a list of private IPs on the first VNIC
data "oci_core_private_ips" "private_ips1" {
  vnic_id = data.oci_core_vnic.instance_vnic1.id
}



# Create 1 reserved public IP and associate with private ip:


resource "oci_core_public_ip" "reserved_public_ip_assigned" {
  compartment_id      = oci_identity_compartment.tf-compartment.id
  display_name   = "asPublicIPAssigned"
  lifetime       = "RESERVED"
  private_ip_id  = lookup(data.oci_core_private_ips.private_ips1.private_ips[0], "id")
}



output "instance_public_url" {
  value = format("https://%s/admin", "oci_core_public_ip.reserved_public_ip_assigned.ip_address")
}


data "oci_core_app_catalog_subscriptions" "test_app_catalog_subscriptions" {
  #Required
  compartment_id = oci_identity_compartment.tf-compartment.id

  #Optional
  listing_id = oci_core_app_catalog_subscription.test_app_catalog_subscription.listing_id

  filter {
    name   = "listing_resource_version"
    values = [oci_core_app_catalog_subscription.test_app_catalog_subscription.listing_resource_version]
  }
}

output "subscriptions" {
  value = [data.oci_core_app_catalog_subscriptions.test_app_catalog_subscriptions.app_catalog_subscriptions]
}
