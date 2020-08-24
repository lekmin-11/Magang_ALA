echo "Mulai Provisioning"
echo "Update packet"
sudo apt-get update
apt-get -y install php apache2 libapache2-mod-php php-curl php-gd php-mysql php-gettext php-json php-opcache php-mbstring php-xml php-cli
sudo apt-get update
sudo apt-get install mysql-server -y
