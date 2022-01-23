package test

import (
	"testing"

	"github.com/gruntwork-io/terratest/modules/terraform"
	"github.com/stretchr/testify/assert"
)

func TestTerraformTagsExample(t *testing.T) {
	expectedTags := map[string]string{
		"Name": "Flugel",
		"Owner": "InfraTeam",
	}
	

	// Construct the terraform options with default retryable errors to handle the most common
	// retryable errors in terraform testing.
	terraformOptions := terraform.WithDefaultRetryableErrors(t, &terraform.Options{
		// Set the path to the Terraform code that will be tested.
		TerraformDir: "../../terraform/example",
		PlanFilePath: "/tmp/terraform-example-plan.out",
	})

	// Clean up resources with "terraform destroy" at the end of the test.
	defer terraform.Destroy(t, terraformOptions)

	// Run "terraform init" and "terraform plan". Fail the test if there are any errors.
	plan := terraform.InitAndPlanAndShowWithStruct(t, terraformOptions)
	
	// Check tags from plan output for s3 resource
	s3Resource := plan.ResourcePlannedValuesMap["aws_s3_bucket.s3"]
	s3Tags := s3Resource.AttributeValues["tags"].(map[string]interface{})
	
	ec2Resource := plan.ResourcePlannedValuesMap["aws_instance.ec2"]
	ec2Tags := ec2Resource.AttributeValues["tags"].(map[string]interface{})
	
	for key,value := range expectedTags{
		assert.Equal(t, value, s3Tags[key])
		assert.Equal(t, value, ec2Tags[key])
	}
}