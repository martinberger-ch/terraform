# provider identity parameters ----------------------------------------------
variable "user_ocid" {
  description = "user OCID used to access OCI"
  type        = string
}
variable "fingerprint" {
  description = "Fingerprint for user"
  type        = string
}

variable "private_key_path" {
  description = "Private Key Path"
  type        = string
}

variable "tenancy_ocid" {
  description = "tenancy id where to create the resources"
  type        = string
}

variable "region" {
  # List of regions: https://docs.cloud.oracle.com/iaas/Content/General/Concepts/regions.htm#ServiceAvailabilityAcrossRegions
  description = "The OCI region where resources will be created"
  type        = string
}


# vcn parameters ----------------------------------------------------
variable "vcn_name" {
  description = "Name of the VCN"
  type        = string
}

variable "vcn_dns_label" {
  description = "DNS Label of the VCN"
  type        = string
}

variable "vcn_cidr" {
  description = "VCN CIDR Range"
  type        = string
}


variable "vcn_public_cidr_block" {
    description = "cidr block of public subnet"
    default     = "10.1.0.0/27"
    type        = string
}

variable "vcn_private_cidr_block" {
    description = "cidr block of private subnet"
    default     = "10.1.0.32/27"
    type        = string
}

variable "nat_gateway_display_name" {
    description = "Display name of NAT gateway"
    default     = "ng-01"
    type        = string
}

variable "internet_gateway_display_name" {
    description = "Display name of internet gateway"
    default     = "ig-01"
    type        = string
}

variable "service_gateway_display_name" {
    description = "Display name of internet gateway"
    default     = "sg-01"
    type        = string
}

variable "service_gateway_enabled" {
    description = "Service gateway enabled"
    default     = true
    type        = bool
}

variable "public_route_table_display_name" {
    description = "Display name of the public route table"
    default     = "rt-public-01"
    type        = string
}

variable "private_route_table_display_name" {
    description = "Display name of the private route table"
    default     = "rt-private-01"
    type        = 

# general oci parameters ----------------------------------------------------
variable "compartment_id" {
  description = "OCID of the compartment"
  type        = string
}


