resource "oci_core_security_list" "private-security-list"{

# Required
  compartment_id = oci_identity_compartment.tf-compartment.id
  vcn_id = module.vcn.vcn_id

# Optional
  display_name = "security-list-for-private-subnet"

  egress_security_rules {
      stateless = false
      destination = "0.0.0.0/0"
      destination_type = "CIDR_BLOCK"
      protocol = "all" 
  }
}