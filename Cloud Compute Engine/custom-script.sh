#! /bin/bash
apt update
apt -y install apache2
Zone=$(curl -s http://metadata.google.internal/computeMetadata/v1/instance/zone -H "Metadata-Flavor: Google") 
InstanceName=$(curl -s http://metadata.google.internal/computeMetadata/v1/instance/name -H "Metadata-Flavor: Google")
cat <<EOF > /var/www/html/index.html
<html><body><h1>MIG V1.0</h1>
<p>Instance Name : $InstanceName <p>
<p>Zone :  $Zone</p>
</body></html>
EOF