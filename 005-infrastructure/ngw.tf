resource "oci_core_nat_gateway" "nat_gateway" {
    #Required
    compartment_id = oci_identity_compartment.tf-compartment.id
    vcn_id = module.vcn.vcn_id

    #Optional
    display_name = var.nat_gateway_display_name
}