#!/bin/bash
set -e

# Enable and start Apache web server (assumes it is already installed)
systemctl enable httpd
systemctl start httpd

# Retrieve IMDSv2 token
TOKEN=$(curl -s -X PUT "http://169.254.169.254/latest/api/token" \
  -H "X-aws-ec2-metadata-token-ttl-seconds: 21600")

# Retrieve instance metadata securely using IMDSv2
INSTANCE_ID=$(curl -s -H "X-aws-ec2-metadata-token: $TOKEN" \
  http://169.254.169.254/latest/meta-data/instance-id)

PRIVATE_IP=$(curl -s -H "X-aws-ec2-metadata-token: $TOKEN" \
  http://169.254.169.254/latest/meta-data/local-ipv4)

# Create simple HTML page
cat <<EOF > /var/www/html/index.html
<!DOCTYPE html>
<html>
<head>
  <title>EC2 Instance Info</title>
</head>
<body>
  <h1>This message was generated on instance $INSTANCE_ID</h1>
  <p>Private IP:
