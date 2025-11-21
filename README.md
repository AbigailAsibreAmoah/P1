# 🍽️ Tasty Bites - Secure Web Hosting on AWS

Complete infrastructure and React frontend for a secure, scalable restaurant website using AWS services.

## 🏗️ Architecture

**Backend Infrastructure:**
- **S3**: Static website hosting with encryption and versioning
- **CloudFront**: Global CDN with HTTPS enforcement  
- **WAF**: Web Application Firewall with managed rule sets
- **IAM**: Least-privilege access policies
- **CloudWatch**: Monitoring and alerting

**Frontend:**
- **React**: Modern responsive website with blue theme
- **Components**: Header, Hero, About, Menu, Contact, Footer

## 📁 Project Structure

```
P1/
├── scripts/              # Deployment automation
│   ├── deploy.sh         # Deploy infrastructure
│   ├── test.sh          # Test infrastructure  
│   ├── destroy.sh       # Destroy infrastructure
│   └── build-frontend.sh # Build and deploy React app
├── backend/              # Terraform infrastructure
│   ├── main.tf
│   ├── variables.tf
│   ├── outputs.tf
│   ├── random.tf
│   └── modules/
│       ├── s3/
│       ├── cloudfront/
│       ├── waf/
│       ├── iam/
│       └── cloudwatch/
└── frontend/             # React application
    ├── package.json
    ├── public/
    └── src/
        └── components/
```

## 🚀 Quick Start

### 1. Deploy Infrastructure
```bash
# Make scripts executable (Linux/Mac)
chmod +x scripts/*.sh

# Deploy AWS infrastructure
./scripts/deploy.sh
```

### 2. Build & Deploy Frontend
```bash
# Build React app and deploy to S3
./scripts/build-frontend.sh
```

### 3. Test Everything
```bash
# Validate infrastructure and test website
./scripts/test.sh
```

## 🔧 Manual Setup

### Backend Infrastructure
```bash
cd backend
cp terraform.tfvars.example terraform.tfvars
# Edit terraform.tfvars with unique bucket name
terraform init
terraform apply
```

### Frontend Development
```bash
cd frontend
npm install
npm start          # Development server
npm run build      # Production build
```

## 🔒 Security Features

- **HTTPS Enforcement**: All traffic redirected to HTTPS
- **WAF Protection**: AWS managed rule sets + rate limiting (2000 req/5min)
- **S3 Security**: Public access blocked, encryption enabled
- **Origin Access Control**: Only CloudFront can access S3
- **Least Privilege IAM**: Minimal deployment permissions

## 📊 Monitoring

- CloudWatch alarms for error rates and latency
- WAF metrics for blocked requests  
- Log retention for 30 days

## 💰 Cost Optimization

- CloudFront PriceClass_100 (US/Canada/Europe)
- S3 Standard storage class
- **Estimated: $0.50-1.50/month** for low traffic

## 🧹 Cleanup

```bash
# Destroy all AWS resources
./scripts/destroy.sh
```

## 🎨 Frontend Features

- **Responsive Design**: Mobile-first approach
- **Blue Theme**: Professional shades of blue
- **Modern UI**: Clean, elegant interface
- **Performance**: Optimized React components
- **SEO Ready**: Proper meta tags and structure

## 📋 Prerequisites

- AWS CLI configured with appropriate credentials
- Terraform >= 1.0 installed
- Node.js >= 16 for React development
- Git Bash or WSL (for Windows users)

## 🔧 Key Features

- **Auto-Generated Bucket Names**: No need to manually create unique S3 bucket names
- **Terraform Validation**: Built-in configuration validation before deployment
- **Manual Confirmation**: Deploy script asks for confirmation before applying changes
- **Error Handling**: Comprehensive error checking in all scripts
- **CloudFront Integration**: Automatic cache invalidation after frontend deployment