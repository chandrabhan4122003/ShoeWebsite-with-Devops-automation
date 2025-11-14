# Setup Instructions

## Before Running This Project

### 1. Update Configuration Files

Replace placeholder values with your actual information:

#### Ansible Inventory (`ansible/inventory/hosts`)

```ini
[webservers]
YOUR_EC2_IP_HERE  # Replace with your EC2 public IP
```

#### Nagios Config (`nagios/redstore-monitoring.cfg`)

```
address    YOUR_EC2_IP_HERE  # Replace with your EC2 public IP
```

### 2. Set AWS Credentials

```bash
# In Windows PowerShell
$env:AWS_ACCESS_KEY_ID="your_access_key"
$env:AWS_SECRET_ACCESS_KEY="your_secret_key"
```

### 3. Generate SSH Key

```bash
# In WSL Ubuntu
ssh-keygen -t rsa -b 4096 -f ~/.ssh/id_rsa
```

### 4. Run Terraform

```powershell
cd terraform
terraform init
terraform apply
# Note the EC2 IP from output
```

### 5. Update Configs with EC2 IP

Update the IP address in:

- `ansible/inventory/hosts`
- `nagios/redstore-monitoring.cfg`

### 6. Run Ansible

```bash
cd /mnt/c/path/to/project
ansible-playbook -i ansible/inventory/hosts ansible/playbooks/deploy.yml
```

### 7. Setup Nagios

```bash
sudo cp nagios/redstore-monitoring.cfg /etc/nagios4/conf.d/
sudo nagios4 -v /etc/nagios4/nagios.cfg
sudo systemctl restart nagios4
```

## ⚠️ Security Notes

- Never commit AWS credentials
- Never commit SSH private keys
- Never commit terraform.tfstate files
- Always use `.gitignore` properly
