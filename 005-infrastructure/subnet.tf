#
# Create Private Subnet
#
resource "oci_core_subnet" "vcn-private-subnet"{

  # Required
  compartment_id = oci_identity_compartment.tf-compartment.id
  vcn_id = module.vcn.vcn_id
  cidr_block = var.vcn_private_cidr_block
 
  # Optional
  # Caution: For the route table id, use module.vcn.nat_route_id.
  # Do not use module.vcn.nat_gateway_id, because it is the OCID for the gateway and not the route table.
  route_table_id = oci_core_route_table.private_route_table.id
  security_list_ids = [oci_core_security_list.private-security-list.id]
  display_name = "sn-regional-private-01"
}


#
# Create Public Subnet
#
resource "oci_core_subnet" "vcn-public-subnet"{

  # Required
  compartment_id = oci_identity_compartment.tf-compartment.id
  vcn_id = module.vcn.vcn_id
  cidr_block = var.vcn_public_cidr_block
 
  # Optional
  route_table_id = oci_core_route_table.public_route_table.id
  security_list_ids = [oci_core_security_list.public-security-list.id]
  display_name = "sn-regional-public-01"
}
