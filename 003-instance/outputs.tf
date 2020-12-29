# Output the "list" of all availability domains.
output "all-availability-domains-in-your-tenancy" {
  value = data.oci_identity_availability_domains.ads.availability_domains
}

# Outputs for compute instance

output "public-ip-for-compute-instance" {
  value = oci_core_instance.ol8_instance.public_ip
}