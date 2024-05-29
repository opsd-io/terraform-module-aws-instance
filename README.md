<a href="https://www.opsd.io" target="_blank"><img alt="OPSd" src=".github/img/OPSD_logo.svg" width="180px"></a>

Meet **OPSd**. The unique and effortless way of managing cloud infrastructure.

# terraform-module-aws-instance

## Introduction

What does the module provide?

## Usage

```hcl
module "module_name" {
  source  = "github.com/opsd-io/terraform-module-aws-instance"

  name          = "my-host"
  ami_id        = data.aws_ami.debian11.id
  instance_type = "t2.micro"
  subnet_id     = module.network.public_subnet_groups["public1"]["a"].id
  key_name      = aws_key_pair.me.key_name
}
```

**IMPORTANT**: Make sure not to pin to master because there may be breaking changes between releases.

<!-- BEGIN_TF_DOCS -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 1.3.1 |
| <a name="requirement_aws"></a> [aws](#requirement\_aws) | ~> 5.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_aws"></a> [aws](#provider\_aws) | ~> 5.0 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [aws_instance.main](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/instance) | resource |
| [aws_route53_record.private_cnames](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/route53_record) | resource |
| [aws_route53_record.private_ip](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/route53_record) | resource |
| [aws_route53_record.public_cnames](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/route53_record) | resource |
| [aws_route53_record.public_ip](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/route53_record) | resource |
| [aws_ec2_instance_type.main](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/ec2_instance_type) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_ami_id"></a> [ami\_id](#input\_ami\_id) | AMI to use for the instance. Overrides the AMI specified in the Launch Template. | `string` | `null` | no |
| <a name="input_associate_public_ip_address"></a> [associate\_public\_ip\_address](#input\_associate\_public\_ip\_address) | Whether to associate a public IP address with an instance in a VPC. Overrides subnet setting. | `bool` | `null` | no |
| <a name="input_common_tags"></a> [common\_tags](#input\_common\_tags) | A map of tags to assign to every resource in this module. | `map(string)` | `{}` | no |
| <a name="input_ebs_optimized"></a> [ebs\_optimized](#input\_ebs\_optimized) | If true, the launched EC2 instance will be EBS-optimized. | `bool` | `null` | no |
| <a name="input_enable_resource_name_dns_a_record"></a> [enable\_resource\_name\_dns\_a\_record](#input\_enable\_resource\_name\_dns\_a\_record) | Indicates whether to respond to DNS queries for instance hostnames with DNS A records. Overrides subnet setting. | `bool` | `null` | no |
| <a name="input_enable_resource_name_dns_aaaa_record"></a> [enable\_resource\_name\_dns\_aaaa\_record](#input\_enable\_resource\_name\_dns\_aaaa\_record) | Indicates whether to respond to DNS queries for instance hostnames with DNS AAAA records. Overrides subnet setting. | `bool` | `null` | no |
| <a name="input_hostname_type"></a> [hostname\_type](#input\_hostname\_type) | Type of hostname for Amazon EC2 instances. Valid values: ip-name and resource-name. Overrides subnet setting. | `string` | `null` | no |
| <a name="input_iam_instance_profile"></a> [iam\_instance\_profile](#input\_iam\_instance\_profile) | IAM Instance Profile to launch the instance with. | `string` | `null` | no |
| <a name="input_instance_type"></a> [instance\_type](#input\_instance\_type) | Instance type to use for the instance. Overrides the instance type specified in the Launch Template. | `string` | `null` | no |
| <a name="input_key_name"></a> [key\_name](#input\_key\_name) | Key name of the Key Pair to use for the instance. | `string` | `null` | no |
| <a name="input_monitoring"></a> [monitoring](#input\_monitoring) | If true, the launched EC2 instance will have detailed monitoring enabled. | `bool` | `false` | no |
| <a name="input_name"></a> [name](#input\_name) | The 'Name' tag of instance. | `string` | n/a | yes |
| <a name="input_private_zone_id"></a> [private\_zone\_id](#input\_private\_zone\_id) | The ID of the hosted zone to contain private IP record. | `string` | `null` | no |
| <a name="input_private_zone_record_cnames"></a> [private\_zone\_record\_cnames](#input\_private\_zone\_record\_cnames) | The CNAMEs of the private zone record. | `list(string)` | `[]` | no |
| <a name="input_private_zone_record_name"></a> [private\_zone\_record\_name](#input\_private\_zone\_record\_name) | The name of the private zone record. Fallback to instance name. | `string` | `null` | no |
| <a name="input_private_zone_record_ttl"></a> [private\_zone\_record\_ttl](#input\_private\_zone\_record\_ttl) | The TTL of the private records. | `number` | `600` | no |
| <a name="input_public_zone_id"></a> [public\_zone\_id](#input\_public\_zone\_id) | The ID of the hosted zone to contain public IP record, if any. | `string` | `null` | no |
| <a name="input_public_zone_record_cnames"></a> [public\_zone\_record\_cnames](#input\_public\_zone\_record\_cnames) | The CNAMEs of the public zone record. | `list(string)` | `[]` | no |
| <a name="input_public_zone_record_name"></a> [public\_zone\_record\_name](#input\_public\_zone\_record\_name) | The name of the public zone record. Fallback to instance name. | `string` | `null` | no |
| <a name="input_public_zone_record_ttl"></a> [public\_zone\_record\_ttl](#input\_public\_zone\_record\_ttl) | The TTL of the public records. | `number` | `600` | no |
| <a name="input_root_iops"></a> [root\_iops](#input\_root\_iops) | Amount of provisioned IOPS. Only valid for root\_volume\_type of io1, io2 or gp3. Defaults to AMI setting. | `number` | `null` | no |
| <a name="input_root_volume_encryption"></a> [root\_volume\_encryption](#input\_root\_volume\_encryption) | Whether to enable root volume encryption. Defaults to AMI setting. | `bool` | `null` | no |
| <a name="input_root_volume_size"></a> [root\_volume\_size](#input\_root\_volume\_size) | Size of the root volume in gibibytes (GiB). Defaults to AMI setting. | `number` | `null` | no |
| <a name="input_root_volume_type"></a> [root\_volume\_type](#input\_root\_volume\_type) | Type of root volume. Defaults to AMI setting. | `string` | `null` | no |
| <a name="input_security_group_ids"></a> [security\_group\_ids](#input\_security\_group\_ids) | List of security group IDs to associate with. | `list(string)` | `[]` | no |
| <a name="input_source_dest_check"></a> [source\_dest\_check](#input\_source\_dest\_check) | Controls if traffic is routed to the instance when the destination address does not match the instance. | `bool` | `true` | no |
| <a name="input_subnet_id"></a> [subnet\_id](#input\_subnet\_id) | VPC Subnet ID to launch in. | `string` | n/a | yes |
| <a name="input_user_data"></a> [user\_data](#input\_user\_data) | User data to provide when launching the instance. | `string` | `null` | no |
| <a name="input_user_data_base64"></a> [user\_data\_base64](#input\_user\_data\_base64) | User data to provide when launching the instance. | `string` | `null` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_arn"></a> [arn](#output\_arn) | The ARN of the instance. |
| <a name="output_id"></a> [id](#output\_id) | The ID of the instance. |
| <a name="output_private_ip"></a> [private\_ip](#output\_private\_ip) | The private IP of the instance. |
| <a name="output_public_ip"></a> [public\_ip](#output\_public\_ip) | The public IP of the instance. |
| <a name="output_root_volume_id"></a> [root\_volume\_id](#output\_root\_volume\_id) | The ID of the root volume. |
<!-- END_TF_DOCS -->

## Examples of usage

Do you want to see how the module works? See all the [usage examples](examples).

## Related modules

The list of related modules (if present).

## Contributing

If you are interested in contributing to the project, see see our [guide](https://github.com/opsd-io/contribution).

## Support

If you have a problem with the module or want to propose a new feature, you can report it via the project's (Github) issue tracker.

If you want to discuss something in person, you can join our community on [Slack](https://join.slack.com/t/opsd-community/signup).

## License

[Apache License 2.0](LICENSE)
