# Machine Setup

Link: https://docs.oracle.com/en-us/iaas/developer-tutorials/tutorials/tf-provider/01-summary.htm

- Oracle Linux
- Terraform installed
- OCI CLI installed and configured


## Test Terraform
```bash
[oci@ol7-devops ~]$ terraform -v
Terraform v0.14.2

Your version of Terraform is out of date! The latest version
is 0.14.3. You can update by downloading from https://www.terraform.io/downloads.html
```

## Test OCI CLI
```bash
[oci@ol7-devops ~]$ oci os ns get
{
  "data": "<your_oci_namespace_here>"
}
```


## Directory oci-tf-openvpnas
Terraform setup for OpenVPN Access Server and a compute instance.

## Directory oci-tf-ansible
Ansible example playbook to use within Terraform.