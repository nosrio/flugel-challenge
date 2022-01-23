output s3_tags{
    value = aws_s3_bucket.s3.tags
}

output ec2_tags{
    value = aws_instance.ec2.tags
}