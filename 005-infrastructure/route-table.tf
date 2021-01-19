resource "oci_core_route_table" "public_route_table" {
  display_name   = var.public_route_table_display_name
    compartment_id = oci_identity_compartment.tf-compartment.id
    vcn_id = module.vcn.vcn_id

  route_rules {
    cidr_block        = "0.0.0.0/0"
    network_entity_id = oci_core_internet_gateway.internet_gateway.id
  }

}

resource "oci_core_route_table" "private_route_table" {
  display_name   = var.private_route_table_display_name
    compartment_id = oci_identity_compartment.tf-compartment.id
    vcn_id = module.vcn.vcn_id

  route_rules {
    cidr_block        = "0.0.0.0/0"
    network_entity_id = oci_core_nat_gateway.nat_gateway.id
  }

}