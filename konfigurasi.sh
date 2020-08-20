echo "masuk direktory home"
cd /home
echo "download wordpress"
sudo wget https://wordpress.org/latest.tar.gz
echo "exstrak file wordpress"
sudo tar xf latest.tar.gz
echo "copy file wordpress"
sudo cp -r wordpress/ /var/www/html/
cd
sudo chmod -R 777 /var/www/html/wordpress/

DBHOST=localhost
DBNAME=wordpress
DBUSER=ricky
DBPASSWD=test123
echo "add database"
sudo mysql -uroot -e "CREATE DATABASE $DBNAME"
echo "add user to databases"
sudo mysql -uroot -e "grant all privileges on $DBNAME.* to '$DBUSER'@'localhost' identified by '$DBPASSWD'"

echo "copy file web.conf"
sudo cp /vagrant/web.conf /etc/apache2/sites-available/
echo "enable web.conf"
sudo a2ensite web.conf
sudo systemctl restart apache2
echo "disabel 00-default"
sudo a2dissite 000-default.conf
echo "restart apache2"
sudo systemctl restart apache2
echo "buka browser dengan IP :192.168.33.15"
