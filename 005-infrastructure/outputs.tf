# - Output Compartment Information -------------------------------------------
# - Compartment Name
# - Compartment Id
# - List of Availability Domains
# ---------------------------------------------------------------------------- 

# Compartment Name
output "compartment-name" {
  value = oci_identity_compartment.tf-compartment.name
}

# Compartment Id
output "compartment-OCID" {
  value = oci_identity_compartment.tf-compartment.id
}

# List of Availability Domains
output "all-availability-domains-in-your-tenancy" {
  value = data.oci_identity_availability_domains.ads.availability_domains
}

# - Output Compute Instances -------------------------------------------------
# - Public IP instance 01
# - Compartment Id
# - List of Availability Domains
# ---------------------------------------------------------------------------- 

# Public IP instance 01
output "public-ip-for-compute-instance-01" {
  value = oci_core_instance.ol8-instance-01.public_ip
}

# Private IP instance 01
output "private-ip-for-compute-instance-01" {
  value = oci_core_instance.ol8-instance-01.private_ip
}


# - Output Network Information -----------------------------------------------
# - VCN OCID
# - Security Lists
# - Subnets
# ---------------------------------------------------------------------------- 

# VCN OCID
output "vcn_id" {
  description = "OCID of the VCN that is created"
  value = module.vcn.vcn_id
}

# Private security list
output "private-security-list-name" {
  value = oci_core_security_list.private-security-list.display_name
}
output "private-security-list-OCID" {
  value = oci_core_security_list.private-security-list.id
}

# Public security list
output "public-security-list-name" {
  value = oci_core_security_list.public-security-list.display_name
}
output "public-security-list-OCID" {
  value = oci_core_security_list.public-security-list.id
}

# Private subnet
output "private-subnet-name" {
  value = oci_core_subnet.vcn-private-subnet.display_name
}
output "private-subnet-OCID" {
  value = oci_core_subnet.vcn-private-subnet.id
}

# Public subnet
output "public-subnet-name" {
  value = oci_core_subnet.vcn-public-subnet.display_name
}
output "public-subnet-OCID" {
  value = oci_core_subnet.vcn-public-subnet.id
}

# DHCP Options
output "dhcp-options-name" {
  value = oci_core_dhcp_options.dhcp-options.display_name
}
output "dhcp-options-OCID" {
  value = oci_core_dhcp_options.dhcp-options.id
}

# - Output OpenVPN ----------- -----------------------------------------------
# - URL
# - Admin Username
# - Admin Password
# ---------------------------------------------------------------------------- 

# URL
output "instance_public_url" {
  value = format("https://%s/admin", oci_core_public_ip.reserved_public_ip_assigned.ip_address)
}

# Admin Username
output "admin_password" {
  value = var.openvpn_admin_password
}

# Admin Password
output "admin_username" {
  value = var.openvpn_admin_username
}