#!/bin/bash
set -e

echo "Deploying Tasty Bites Infrastructure..."

# Navigate to backend directory
if [ ! -d "backend" ]; then
    echo "Error: backend directory not found"
    exit 1
fi
cd backend

# Check if terraform.tfvars exists
if [ ! -f "terraform.tfvars" ]; then
    if [ ! -f "terraform.tfvars.example" ]; then
        echo "Error: terraform.tfvars.example not found"
        exit 1
    fi
    echo "terraform.tfvars not found. Copying from example..."
    cp terraform.tfvars.example terraform.tfvars
    echo "Please edit terraform.tfvars with your unique bucket name before continuing."
    exit 1
fi

# Initialize Terraform
echo "Initializing Terraform..."
terraform init

# Validate configuration
echo "Validating Terraform configuration..."
terraform validate

# Plan deployment
echo "Planning deployment..."
terraform plan

# Apply configuration with confirmation
echo "Applying configuration..."
terraform apply

# Get outputs
echo "Deployment complete!"
echo "Infrastructure outputs:"
terraform output

WEBSITE_URL=$(terraform output -raw website_url 2>/dev/null || echo "")
S3_BUCKET=$(terraform output -raw s3_bucket_name 2>/dev/null || echo "")

if [ ! -z "$WEBSITE_URL" ]; then
    echo "Website URL: https://$WEBSITE_URL"
fi
if [ ! -z "$S3_BUCKET" ]; then
    echo "S3 Bucket: $S3_BUCKET"
fi

cd ..
echo "Ready to deploy frontend to S3 bucket!"