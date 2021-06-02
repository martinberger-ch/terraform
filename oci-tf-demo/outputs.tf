output "vcn_id" {
  description = "OCID of the VCN that is created"
  value = module.vcn.vcn_id
}

output "pubip1_address" {
  value = oci_core_public_ip.pubip1.ip_address
}