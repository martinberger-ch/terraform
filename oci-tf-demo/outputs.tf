output "vcn_id" {
  description = "OCID of the VCN that is created"
  value = module.vcn.vcn_id
}

output "public-ip-1_address" {
  value = oci_core_public_ip.public-ip-1.ip_address
}