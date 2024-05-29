variable "common_tags" {
  description = "A map of tags to assign to every resource in this module."
  type        = map(string)
  default     = {}
}

variable "name" {
  description = "The 'Name' tag of instance."
  type        = string
}

variable "ami_id" {
  description = "AMI to use for the instance. Overrides the AMI specified in the Launch Template."
  type        = string
  default     = null
}

variable "instance_type" {
  description = "Instance type to use for the instance. Overrides the instance type specified in the Launch Template."
  type        = string
  default     = null
}

variable "ebs_optimized" {
  description = "If true, the launched EC2 instance will be EBS-optimized."
  type        = bool
  default     = null
}


variable "root_volume_encryption" {
  description = "Whether to enable root volume encryption. Defaults to AMI setting."
  type        = bool
  default     = null
}

variable "root_volume_type" {
  description = "Type of root volume. Defaults to AMI setting."
  type        = string
  default     = null
}

variable "root_volume_size" {
  description = "Size of the root volume in gibibytes (GiB). Defaults to AMI setting."
  type        = number
  default     = null
}

variable "root_iops" {
  description = "Amount of provisioned IOPS. Only valid for root_volume_type of io1, io2 or gp3. Defaults to AMI setting."
  type        = number
  default     = null
}

variable "subnet_id" {
  description = "VPC Subnet ID to launch in."
  type        = string
}

variable "associate_public_ip_address" {
  description = "Whether to associate a public IP address with an instance in a VPC. Overrides subnet setting."
  type        = bool
  default     = null
}

variable "hostname_type" {
  description = "Type of hostname for Amazon EC2 instances. Valid values: ip-name and resource-name. Overrides subnet setting."
  type        = string
  default     = null
}

variable "enable_resource_name_dns_a_record" {
  description = "Indicates whether to respond to DNS queries for instance hostnames with DNS A records. Overrides subnet setting."
  type        = bool
  default     = null
}

variable "enable_resource_name_dns_aaaa_record" {
  description = "Indicates whether to respond to DNS queries for instance hostnames with DNS AAAA records. Overrides subnet setting."
  type        = bool
  default     = null
}

variable "source_dest_check" {
  description = "Controls if traffic is routed to the instance when the destination address does not match the instance."
  type        = bool
  default     = true
}

variable "key_name" {
  description = "Key name of the Key Pair to use for the instance."
  type        = string
  default     = null
}

variable "user_data" {
  description = "User data to provide when launching the instance."
  type        = string
  default     = null
}

variable "user_data_base64" {
  description = "User data to provide when launching the instance."
  type        = string
  default     = null
}

variable "iam_instance_profile" {
  description = "IAM Instance Profile to launch the instance with."
  type        = string
  default     = null
}

variable "monitoring" {
  description = "If true, the launched EC2 instance will have detailed monitoring enabled."
  type        = bool
  default     = false
}

variable "security_group_ids" {
  description = "List of security group IDs to associate with."
  type        = list(string)
  default     = []
}

variable "private_zone_id" {
  description = "The ID of the hosted zone to contain private IP record."
  type        = string
  default     = null
}

variable "public_zone_id" {
  description = "The ID of the hosted zone to contain public IP record, if any."
  type        = string
  default     = null
}

variable "private_zone_record_name" {
  description = "The name of the private zone record. Fallback to instance name."
  type        = string
  default     = null
}

variable "public_zone_record_name" {
  description = "The name of the public zone record. Fallback to instance name."
  type        = string
  default     = null
}

variable "private_zone_record_cnames" {
  description = "The CNAMEs of the private zone record."
  type        = list(string)
  default     = []
}

variable "public_zone_record_cnames" {
  description = "The CNAMEs of the public zone record."
  type        = list(string)
  default     = []
}

variable "private_zone_record_ttl" {
  description = "The TTL of the private records."
  type        = number
  default     = 600
}

variable "public_zone_record_ttl" {
  description = "The TTL of the public records."
  type        = number
  default     = 600
}
