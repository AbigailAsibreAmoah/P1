#!/bin/bash
set -e

echo "Testing Tasty Bites Infrastructure..."

if [ ! -d "backend" ]; then
    echo "Error: backend directory not found"
    exit 1
fi
cd backend

# Validate Terraform configuration
echo "Validating Terraform configuration..."
terraform validate

# Format check
echo "Checking Terraform formatting..."
terraform fmt -check

# Plan without applying
echo "Running terraform plan..."
terraform plan

# Check if infrastructure exists
if terraform show > /dev/null 2>&1; then
    echo "Testing deployed infrastructure..."
    
    # Get website URL
    WEBSITE_URL=$(terraform output -raw website_url 2>/dev/null || echo "")
    
    if [ ! -z "$WEBSITE_URL" ]; then
        echo "Testing website accessibility..."
        curl -I --max-time 30 --connect-timeout 10 "https://$WEBSITE_URL" || echo "Website not accessible yet (may take time to propagate)"
    fi
    
    echo "Current infrastructure state:"
    terraform output
else
    echo "No infrastructure deployed yet."
fi

cd ..
echo "Tests completed!"