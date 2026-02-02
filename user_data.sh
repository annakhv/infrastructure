#!/bin/bash
set -e

# Update system packages
yum update -y

# Install required packages
yum install -y httpd aws-cli jq curl

# Enable and start Apache web server
systemctl enable httpd
systemctl start httpd

# Retrieve IMDSv2 token
TOKEN=$(curl -X PUT "http://169.254.169.254/latest/api/token" \
  -H "X-aws-ec2-metadata-token-ttl-seconds: 21600")

# Retrieve instance metadata securely using IMDSv2
INSTANCE_ID=$(curl -H "X-aws-ec2-metadata-token: $TOKEN" \
  http://169.254.169.254/latest/meta-data/instance-id)

PRIVATE_IP=$(curl -H "X-aws-ec2-metadata-token: $TOKEN" \
  http://169.254.169.254/latest/meta-data/local-ipv4)

# Create simple HTML page
cat <<EOF > /var/www/html/index.html
<!DOCTYPE html>
<html>
<head>
  <title>EC2 Instance Info</title>
</head>
<body>
  <h1>This message was generated on instance $INSTANCE_ID with the following IP: $PRIVATE_IP</h1>
</body>
</html>
EOF

# Ensure correct permissions
chmod 755 /var/www/html/index.html
