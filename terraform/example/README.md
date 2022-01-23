# README.md

This module creates a S3 bucket and a EC2 instance with tags at local.common\_tags.

Before running aws-cli must be configured or the following vars must be exported.
```
export AWS_ACCESS_KEY_ID=<access key id>
export AWS_SECRET_KEY_ID=<secret key id>
```

Use the following commands to deploy infrastructure
```
terraform init
terraform plan
terraform apply
```
AWS region and ec2 instance-type can be passed as arguments with the flags `-var 'aws_region='` and `-var 'instance_type='`. By default, this parameters are set to `us-east-1` and `t3.micro`.

## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 0.11.7 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_aws"></a> [aws](#provider\_aws) | 3.73.0 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [aws_instance.ec2](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/instance) | resource |
| [aws_s3_bucket.s3](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/s3_bucket) | resource |
| [aws_ami.ami](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/ami) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_instance_type"></a> [instance\_type](#input\_instance\_type) | AWS EC2 instance type | `string` | `"t3.micro"` | no |
| <a name="input_region"></a> [region](#input\_region) | AWS region to deploy resources | `string` | `"us-east-1"` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_ec2_name"></a> [ec2\_name](#output\_ec2\_name) | n/a |
| <a name="output_ec2_tags"></a> [ec2\_tags](#output\_ec2\_tags) | n/a |
| <a name="output_s3_name"></a> [s3\_name](#output\_s3\_name) | n/a |
| <a name="output_s3_tags"></a> [s3\_tags](#output\_s3\_tags) | n/a |
