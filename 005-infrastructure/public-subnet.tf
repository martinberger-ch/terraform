resource "oci_core_subnet" "vcn-public-subnet"{

  # Required
  compartment_id = oci_identity_compartment.tf-compartment.id
  vcn_id = module.vcn.vcn_id
  cidr_block = var.public_cidr_block
 
  # Optional
  route_table_id = oci_core_route_table.public_route_table.id
  security_list_ids = [oci_core_security_list.public-security-list.id]
  display_name = "sn-regional-public-01"
}