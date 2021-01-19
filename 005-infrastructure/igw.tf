resource "oci_core_internet_gateway" "internet_gateway" {
    #Required
    compartment_id = oci_identity_compartment.tf-compartment.id
    vcn_id = module.vcn.vcn_id

    #Optional
    display_name = var.internet_gateway_display_name
}