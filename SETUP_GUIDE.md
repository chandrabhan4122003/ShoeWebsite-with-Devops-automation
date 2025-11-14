# RedStore E-commerce - Setup Guide

This guide will help you run the RedStore e-commerce website with full DevOps pipeline on your laptop.

---

## 📋 Prerequisites

### Required Software:

1. **Windows OS** (with PowerShell)
2. **WSL Ubuntu** (Windows Subsystem for Linux)
3. **Terraform** (for AWS infrastructure)
4. **Ansible** (for deployment)
5. **Nagios** (for monitoring)
6. **AWS Account** (with credentials)

---

## 🚀 Quick Setup (3 Options)

### Option 1: View Website Locally (Simplest)

Just open `index.html` in your browser - no setup needed!

```bash
# Double-click index.html or
start index.html
```

### Option 2: Run with Simple Web Server

```bash
# Using Python
python -m http.server 8000

# Access: http://localhost:8000
```

### Option 3: Full DevOps Pipeline (AWS Deployment)

Follow the detailed steps below.

---

## 🔧 Detailed Setup for Full DevOps Pipeline

### Step 1: Install WSL Ubuntu (Windows)

```powershell
# In PowerShell (as Administrator)
wsl --install -d Ubuntu

# Restart your computer
# Set up Ubuntu username and password
```

### Step 2: Install Terraform (Windows)

1. Download Terraform from: https://www.terraform.io/downloads
2. Extract to: `C:\terraform\`
3. Add to PATH or use full path

### Step 3: Install Ansible (WSL Ubuntu)

```bash
# In WSL Ubuntu
sudo apt update
sudo apt install -y ansible
```

### Step 4: Install Nagios (WSL Ubuntu)

```bash
# Install Nagios
sudo apt install -y nagios4 nagios-plugins-contrib

# Set Nagios admin password
sudo htpasswd -c /etc/nagios4/htpasswd.users nagiosadmin

# Start Nagios
sudo systemctl start nagios4
sudo systemctl enable nagios4
```

### Step 5: Configure AWS Credentials

1. Create AWS account: https://aws.amazon.com
2. Create IAM user with EC2 permissions
3. Get Access Key ID and Secret Access Key

```powershell
# In Windows PowerShell
$env:AWS_ACCESS_KEY_ID="your_access_key"
$env:AWS_SECRET_ACCESS_KEY="your_secret_key"
```

### Step 6: Generate SSH Key (WSL Ubuntu)

```bash
# In WSL Ubuntu
ssh-keygen -t rsa -b 4096 -f ~/.ssh/id_rsa -N ""
```

---

## 🚀 Deployment Steps

### Step 1: Deploy Infrastructure with Terraform

```powershell
# In Windows PowerShell
cd path\to\redstore\terraform

# Initialize Terraform
terraform init

# Create infrastructure
terraform apply

# Note the EC2 IP address from output!
```

### Step 2: Deploy Website with Ansible

```bash
# In WSL Ubuntu
cd /mnt/c/path/to/redstore

# Update ansible/inventory/hosts with your EC2 IP
nano ansible/inventory/hosts
# Add your EC2 IP under [webservers]

# Test connection
ansible webservers -i ansible/inventory/hosts -m ping

# Deploy website
ansible-playbook -i ansible/inventory/hosts ansible/playbooks/deploy.yml
```

### Step 3: Setup Nagios Monitoring

```bash
# In WSL Ubuntu
# Update nagios/redstore-monitoring.cfg with your EC2 IP
nano nagios/redstore-monitoring.cfg
# Replace YOUR_EC2_IP_HERE with actual IP

# Copy to Nagios
sudo cp nagios/redstore-monitoring.cfg /etc/nagios4/conf.d/

# Verify and restart
sudo nagios4 -v /etc/nagios4/nagios.cfg
sudo systemctl restart nagios4
```

---

## 🌐 Access Your Website

- **Website**: http://YOUR_EC2_IP
- **Nagios Dashboard**: http://localhost/nagios4
  - Username: `nagiosadmin`
  - Password: (what you set earlier)

---

## 🧹 Cleanup (Stop AWS Billing)

```powershell
# In Windows PowerShell
cd path\to\redstore\terraform
terraform destroy
```

Type `yes` to confirm.

---

## 📁 Project Structure

```
redstore/
├── index.html              # Main website
├── products.html           # Products page
├── cart.html              # Shopping cart
├── account.html           # User account
├── style.css              # Styles
├── images/                # Product images
│
├── terraform/             # AWS Infrastructure
│   ├── main.tf           # EC2 configuration
│   ├── variables.tf      # Variables
│   ├── outputs.tf        # Outputs
│   └── terraform.tfvars  # Variable values
│
├── ansible/              # Deployment Automation
│   ├── playbooks/
│   │   └── deploy.yml    # Deployment playbook
│   ├── templates/
│   │   └── nginx.conf.j2 # Nginx config
│   ├── inventory/
│   │   └── hosts         # Server inventory
│   └── ansible.cfg       # Ansible settings
│
└── nagios/               # Monitoring
    ├── redstore-monitoring.cfg  # Monitoring config
    └── commands.cfg             # Custom commands
```

---

## 🐛 Troubleshooting

### Terraform Issues

```powershell
# Check AWS credentials
$env:AWS_ACCESS_KEY_ID
$env:AWS_SECRET_ACCESS_KEY

# Reinitialize
terraform init -upgrade
```

### Ansible Connection Issues

```bash
# Test SSH connection
ssh -i ~/.ssh/id_rsa ubuntu@YOUR_EC2_IP

# Check key permissions
chmod 600 ~/.ssh/id_rsa
```

### Nagios Not Working

```bash
# Check status
sudo systemctl status nagios4

# View logs
sudo tail -f /var/log/nagios4/nagios.log

# Restart services
sudo systemctl restart nagios4
sudo systemctl restart apache2
```

### Website Not Loading

```bash
# Check if EC2 is running (AWS Console)
# Check security group allows port 80
# Test from WSL: curl http://YOUR_EC2_IP
```

---

## 💡 Tips

1. **AWS Free Tier**: Use t2.micro instance (free for 12 months)
2. **Cost**: ~$0.01/hour if not on free tier
3. **Always Cleanup**: Run `terraform destroy` when done
4. **Security**: Never commit AWS credentials to Git
5. **Monitoring**: Check Nagios dashboard regularly

---

## 📞 Support

If you encounter issues:

1. Check the troubleshooting section
2. Verify all prerequisites are installed
3. Ensure AWS credentials are correct
4. Check firewall/security group settings

---

## 🎯 What You'll Learn

- ✅ Infrastructure as Code (Terraform)
- ✅ Configuration Management (Ansible)
- ✅ Monitoring & Alerting (Nagios)
- ✅ AWS Cloud Services
- ✅ DevOps Best Practices

---

**Enjoy your RedStore e-commerce website with full DevOps pipeline!** 🚀
