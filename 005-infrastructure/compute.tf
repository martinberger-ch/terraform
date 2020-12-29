
resource "oci_core_instance" "ol8_instance" {
    # Required
    availability_domain = data.oci_identity_availability_domains.ads.availability_domains[0].name
    compartment_id = oci_identity_compartment.tf-compartment.id
    shape = var.compute_shape
    source_details {
        source_id = var.compute_source_id
        source_type = "image"
    }

    # Optional
    display_name = var.compute_display_name
    create_vnic_details {
        assign_public_ip = true
        subnet_id = oci_core_subnet.vcn-public-subnet.id
    }
    metadata = {
        ssh_authorized_keys = file(var.compute_ssh_authorized_keys)
    } 
    preserve_boot_volume = false
}