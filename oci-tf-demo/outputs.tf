output "vcn_id" {
  description = "OCID of the VCN that is created"
  value = module.vcn.vcn_id
}

output "apachedevpubip_address" {
  value = oci_core_public_ip.apachedevpubip.ip_address
}