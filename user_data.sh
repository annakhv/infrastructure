#!/bin/bash
set -eux

# Update system
yum update -y

# Install Apache
yum install -y httpd

# Start and enable Apache
systemctl start httpd
systemctl enable httpd

# Create a health check endpoint
echo "OK" > /var/www/html/health

# Optional: basic index page
echo "Hello from EC2" > /var/www/html/index.html
