# verify availability domain -------------------------------------------------
data "oci_identity_availability_domains" "ads" {
  compartment_id = var.compartment_id
}


# Oracle Linux instance according image OCID
resource "oci_core_instance" "compute_instance" {
    # Required
    availability_domain = data.oci_identity_availability_domains.ads.availability_domains[0].name
    compartment_id = var.compartment_id
    shape = var.compute_shape
    source_details {
        source_id = var.linux_image_ocid[var.region]
        source_type = "image"
    }

    # Optional
    display_name = var.compute_display_name
    create_vnic_details {
        assign_public_ip = false
        subnet_id = oci_core_subnet.vcn-private-subnet.id
    }
    metadata = {
        ssh_authorized_keys = file(var.compute_ssh_authorized_keys)
    } 
    preserve_boot_volume = false

}

resource "oci_core_public_ip" "demo_public_ip" {
  compartment_id = var.compartment_id
  display_name   = "reserved public ip"
  lifetime       = "RESERVED"
  private_ip_id  = ""
}
 
data "oci_core_private_ips" "demo_public_ips" {
ip_address = oci_core_instance.demo_public_ip.private_ip
subnet_id  = oci_core_subnet.vcn-public-subnet.id
}

resource "oci_core_public_ip" "demo_public_ip-1" {
compartment_id = var.compartment_id
display_name   = "reserved public ip"
lifetime       = "RESERVED"
private_ip_id  = data.oci_core_private_ips.demo_public_ips.private_ips[0]["id"]
}