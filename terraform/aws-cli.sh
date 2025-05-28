sudo apt-get update
sudo yum remove awscli
curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "awscliv2.zip"
sudo apt-get install unzip -y
unzip -u awscliv2.zip
sudo ./aws/install
aws --version