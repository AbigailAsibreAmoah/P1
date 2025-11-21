#!/bin/bash
set -e

echo "Building Tasty Bites Frontend..."

if [ ! -d "frontend" ]; then
    echo "Error: frontend directory not found"
    exit 1
fi
cd frontend

# Check if package.json exists
if [ ! -f "package.json" ]; then
    echo "Error: package.json not found in frontend directory"
    exit 1
fi

# Install dependencies
echo "Installing dependencies..."
npm install

# Build the React app
echo "Building React app..."
npm run build

# Get S3 bucket name from Terraform output
if [ ! -d "../backend" ]; then
    echo "Error: backend directory not found"
    exit 1
fi
cd ../backend
BUCKET_NAME=$(terraform output -raw s3_bucket_name 2>/dev/null || echo "")

if [ -z "$BUCKET_NAME" ]; then
    echo "No S3 bucket found. Please deploy infrastructure first with ./deploy.sh"
    exit 1
fi

echo "Deploying to S3 bucket: $BUCKET_NAME"

# Check if build directory exists
if [ ! -d "../frontend/build" ]; then
    echo "Error: frontend build directory not found. Run npm run build first."
    exit 1
fi

# Sync build files to S3
aws s3 sync ../frontend/build/ "s3://$BUCKET_NAME" --delete

# Get CloudFront distribution ID and create invalidation
DISTRIBUTION_ID=$(terraform output -raw cloudfront_distribution_id 2>/dev/null || echo "")

if [ ! -z "$DISTRIBUTION_ID" ]; then
    echo "Creating CloudFront invalidation..."
    aws cloudfront create-invalidation --distribution-id "$DISTRIBUTION_ID" --paths "/*"
fi

echo "Frontend deployed successfully!"
echo "Website URL: https://$(terraform output -raw website_url)"