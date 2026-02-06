#!/bin/bash
yum update -y
yum install -y httpd
systemctl start httpd
systemctl enable httpd

cat <<EOF > /var/www/html/index.html
<!DOCTYPE html>
<html>
<head>
  <title>Green Environment</title>
</head>
<body>
  <h1>Green Environment</h1>
</body>
</html>
EOF
