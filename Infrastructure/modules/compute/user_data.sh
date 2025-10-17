#!/bin/bash
# Update system
yum update -y

# Install web server
yum install -y httpd

# Start and enable httpd
systemctl start httpd
systemctl enable httpd

# Create custom index page
cat > /var/www/html/index.html << EOF
<html>
<head>
    <title>${project_name}</title>
</head>
<body>
    <h1>Welcome to ${project_name}</h1>
    <p>Server: $(hostname -f)</p>
    <p>Availability Zone: $(curl -s http://169.254.169.254/latest/meta-data/placement/availability-zone)</p>
    <p>IP Address: $(curl -s http://169.254.169.254/latest/meta-data/local-ipv4)</p>
</body>
</html>
EOF

# Health check endpoint
cat > /var/www/html/health.html << EOF
<html>
<body>
    <h1>Health Check</h1>
    <p>Status: Healthy</p>
    <p>Timestamp: $(date)</p>
</body>
</html>
EOF