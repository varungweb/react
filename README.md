# 🚀 Static Website Hosting with React + AWS (S3 + CloudFront) Using Terraform & Docker

This project shows how to deploy a frontend app (like React) to AWS using a private S3 bucket and expose it via CloudFront for global low-latency access.

Everything is automated using **Terraform** (for infra) and **Docker** (for building & uploading the app).


---
#### Note: Must update the Access Key and Secret Key in Secrets. also updat ethe cloudfront Distribution ID in secrets.
---

## 🔧 Stack Used

- **React** (or any static frontend framework)
- **Docker** – for consistent build + S3 upload
- **AWS S3** – to store static site (with public access disabled)
- **AWS CloudFront** – to serve site securely and quickly
- **Terraform** – for deploying infra

---

## 🛠️ How It Works

### 1. 🐳 Build & Upload (Docker)

- Docker builds the React app using `npm run build`
- Uploads the static files to an S3 bucket (private)

### 2. ☁️ Deploy Infra (Terraform)

- Creates S3 bucket (private, no public access)
- Creates a CloudFront distribution with S3 as the origin
- Outputs the CloudFront URL to access the site


---

## ✅ Steps to Use

1. **Set your AWS credentials** locally  
2. **Update Terraform variables** for region, bucket name, etc.
3. **Run Terraform** to provision infra

```bash
cd terraform
terraform init
terraform apply
````

4. **Run Docker to build/package & upload to S3**

5. **Access your app** via the CloudFront URL from Terraform output

---

## 💡 Benefits of This Setup

* ✅ **Low-cost hosting** (S3 + CloudFront is cheap)
* 🌍 **Global CDN delivery** (via CloudFront)
* 🔒 **No public access to S3** (better security)
* 📦 **Docker ensures clean builds**
* 🧱 **Infra as Code with Terraform**

---

## Architecture Diagram
<img width="841" height="440" alt="s3" src="https://github.com/user-attachments/assets/2f03004a-e91f-40a4-b4d0-1997dc002840" />


---
## 📌 Notes

* You can replace `simple-react` with any frontend build
* Works with any static site: React, Vue, HTML, etc.
* CloudFront handles caching automatically
