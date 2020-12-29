
resource "oci_core_instance" "ol8_instance" {
    # Required
    availability_domain = data.oci_identity_availability_domains.ads.availability_domains[0].name
    compartment_id = "ocid1.compartment.oc1..aaaaaaaax3li46zbz4ffc3xuuea3u5t3rq5haezki5hnaj4msb32legznpaq"
    shape = "VM.Standard.E2.1"
    source_details {
        source_id = "ocid1.image.oc1.eu-zurich-1.aaaaaaaaxuq5fxk44frdwth73qxxdyfbmfzmqauyoo5d6ortrwhgfp5lme2q"
        source_type = "image"
    }

    # Optional
    display_name = "My Test OL8 Instance"
    create_vnic_details {
        assign_public_ip = true
        subnet_id = "ocid1.subnet.oc1.eu-zurich-1.aaaaaaaae5zhx6efwhakchtd3c4fhlnpp2cnbvwawpqa7zt4qbppqdhhe2wa"
    }
    metadata = {
        ssh_authorized_keys = file("/home/oci/.oci/terraform_deployments_29122020.pub")
    } 
    preserve_boot_volume = false
}