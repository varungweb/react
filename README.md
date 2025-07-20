**Step-by-step guide** to pre-validate ACM for `*.domain.com` before running Terraform, using your plan:

---

### ✅ Goal:

To **pre-validate** an ACM certificate for `*.domain.com`, so that Terraform can **auto-validate** the certificate without waiting for DNS later.

---

### 🔢 Steps Guide:

#### **STEP 1: Manually create ACM certificate in `us-east-1`**

1. Go to the [ACM Console – N. Virginia (us-east-1)](https://us-east-1.console.aws.amazon.com/acm)
2. Click **"Request a certificate"**
3. Choose **"Request a public certificate"**
4. Enter domain: `*.domain.com` (wildcard)
5. Choose **DNS validation**
6. Complete and click **"Request"**

---

#### **STEP 2: Copy DNS CNAME records**

1. In the certificate details, find the **CNAME record(s)** under "Validation"
2. Copy:

   * **Record Name**
   * **Record Type (CNAME)**
   * **Record Value**

---

#### **STEP 3: Add CNAME record to your DNS**

* If using Route53:

  * Go to **Route53 > Hosted Zones > domain.com**
  * Click **"Create record"**
  * Choose **CNAME**, paste name and value
* If using another DNS provider (Cloudflare, GoDaddy, etc.):

  * Add the CNAME record exactly as shown in ACM

✅ **Wait a few minutes** — ACM will detect the validation and mark it **"Issued"**

---

#### **STEP 4: Delete the validated certificate**

1. Go back to **ACM Console**
2. Select the issued cert for `*.domain.com`
3. Click **"Delete"**

⚠️ **Do not delete the DNS record!** Keep the CNAME in your DNS — it’s reused!

---

#### **STEP 5: Now run your Terraform code**
#### **Note: Must setup the backend.tf first**
* When you run:

```bash
cd Terraform
terraform init
terraform apply
```

✅ The ACM cert will be **auto-validated** because ACM finds the DNS validation already present.

---

### 🧪 Verify:

After `terraform apply`:

* Check ACM console — cert should show **"Issued"**
* No manual DNS steps required anymore

---

Would you like me to generate the Terraform for **Route53 auto-validation** next time so this is fully automated?


# React + Vite

This template provides a minimal setup to get React working in Vite with HMR and some ESLint rules.

Currently, two official plugins are available:

- [@vitejs/plugin-react](https://github.com/vitejs/vite-plugin-react/blob/main/packages/plugin-react) uses [Babel](https://babeljs.io/) for Fast Refresh
- [@vitejs/plugin-react-swc](https://github.com/vitejs/vite-plugin-react/blob/main/packages/plugin-react-swc) uses [SWC](https://swc.rs/) for Fast Refresh

## Expanding the ESLint configuration

If you are developing a production application, we recommend using TypeScript with type-aware lint rules enabled. Check out the [TS template](https://github.com/vitejs/vite/tree/main/packages/create-vite/template-react-ts) for information on how to integrate TypeScript and [`typescript-eslint`](https://typescript-eslint.io) in your project.
