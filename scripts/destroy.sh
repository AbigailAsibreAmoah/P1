#!/bin/bash
set -e

echo "Destroying Tasty Bites Infrastructure..."

if [ ! -d "backend" ]; then
    echo "Error: backend directory not found"
    exit 1
fi
cd backend

# Check if infrastructure exists
if ! terraform show > /dev/null 2>&1; then
    echo "No infrastructure found to destroy."
    exit 0
fi

echo "This will destroy ALL infrastructure resources!"
echo "Current resources:"
terraform show

read -p "Are you sure you want to destroy everything? (yes/no): " confirm

if [[ "${confirm,,}" =~ ^(yes|y)$ ]]; then
    echo "Destroying infrastructure..."
    terraform destroy -auto-approve
    echo "Infrastructure destroyed successfully!"
else
    echo "Destruction cancelled."
    exit 1
fi

cd ..
echo "Cleanup complete!"