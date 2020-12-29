
resource "oci_core_instance" "ol8_instance" {
    # Required
    availability_domain = data.oci_identity_availability_domains.ads.availability_domains[0].name
    compartment_id = oci_identity_compartment.tf-compartment.id
    shape = "VM.Standard.E2.1"
    source_details {
        source_id = "ocid1.image.oc1.eu-zurich-1.aaaaaaaaxuq5fxk44frdwth73qxxdyfbmfzmqauyoo5d6ortrwhgfp5lme2q"
        source_type = "image"
    }

    # Optional
    display_name = "My Test OL8 Instance TF3"
    create_vnic_details {
        assign_public_ip = true
        subnet_id = oci_core_subnet.vcn-public-subnet.id
    }
    metadata = {
        ssh_authorized_keys = file("/home/oci/.oci/terraform_deployments_29122020.pub")
    } 
    preserve_boot_volume = false
}