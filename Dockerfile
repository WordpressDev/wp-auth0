FROM wordpress:4.9.6

# Add sudo in order to run wp-cli as the www-data user 
RUN apt-get update && apt-get install -y sudo less

# Add WP-CLI 
RUN curl -o /bin/wp-cli.phar https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar
COPY wp-su.sh /bin/wp
RUN chmod +x /bin/wp-cli.phar /bin/wp

RUN apt-get install wget && apt-get install unzip

#RUN wget https://downloads.wordpress.org/plugin/two-factor.zip \
#&& unzip two-factor.zip -d /tmp/ && rm two-factor.zip 
#CMD cp -rf /tmp/two-factor/ /var/www/html/wp-content/plugins

#CMD wp plugin install two-factor
#CMD wp plugin activate two-factor


#RUN wp core download --path=/var/www/html --allow-root

RUN wget https://downloads.wordpress.org/plugin/auth0.zip \
&& unzip auth0.zip -d /tmp/ && rm auth0.zip
CMD cp -rf /tmp/auth0 /var/www/html/wp-content/plugins


#ADD wp-config.php /var/www/html/wp-config.php

COPY plugins/ /var/www/html/wp-content/plugins/
#WORKDIR /var/www/html 
#RUN wp core download --path=/var/www/html  --allow-root
#RUN wp core config --path=/var/www/html --dbname=wordpress --dbuser=root --allow-root
#RUN wp core install --url='http://${LOCAL_ADDRESS}/' --title='${WP_NAME}' --admin_user='${WP_USERNAME}' \
#    --admin_password='${WP_PASSWORD}' --admin_email='${WP_EMAIL}' --skip-email  --path=/var/www/html --allow-root
 
#--path=`/var/www/html` 
#RUN wp plugin install w3-total-cache contact-form-7 --activate --path=`/var/www/html` \
#	&& wp plugin install wp-mail-smtp wp-pgp-encrypted-emails --path=`/var/www/html`

#RUN wp plugin install auth0 --path="/var/www/html" --allow-root
#RUN wp plugin activate auth0 --path="/var/www/html" --allow-root


