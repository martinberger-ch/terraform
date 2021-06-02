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

# general oci parameters ----------------------------------------------------
variable "compartment_id" {
  description = "OCID of the compartment"
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
    description = "cidr block of VCN"
    default     = "10.1.0.0/24"
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
    type        = string
}

# compute instance parameters ----------------------------------------------------
variable "compute_shape" {
  description = "The shape of compute instance."
  default     = "VM.Standard.E2.1"
  type        = string
}

variable "linux_image_ocid" {
  type = map

  default = {
    # See https://docs.us-phoenix-1.oraclecloud.com/images/
    # Oracle-provided image "Oracle-Linux-7.8-2020.04.17-0"
    eu-zurich-1     = "ocid1.image.oc1.eu-zurich-1.aaaaaaaa5ganyj57k2dqyik4m4btpuq23le3e7clh56rjhgz6fekvtoyazqa"
    eu-frankfurt-1  = "ocid1.image.oc1.eu-frankfurt-1.aaaaaaaavz6p7tyrczcwd5uvq6x2wqkbwcrjjbuohbjomtzv32k5bq24rsha"
    eu-amsterdam-1  = "ocid1.image.oc1.eu-amsterdam-1.aaaaaaaaie5km236l53ymcvpwufyb2srtc3hw2pa6astfjdafzlxxdv5nfsq"
    us-ashburn-1    = "ocid1.image.oc1.iad.aaaaaaaahjkmmew2pjrcpylaf6zdddtom6xjnazwptervti35keqd4fdylca"
  }
}

variable "compute_display_name" {
  description = "Display name of host"
  default     = "Test Server - Public Subnet"
  type        = string
}

variable "compute_ssh_authorized_keys" {
  description = "path to the ssh public key file"
  default     = ""
  type        = string
}