FILE="/usr/local/bin/occ"
cat <<EOM >$FILE
#! /bin/bash
cd /var/www/html/owncloud
sudo -E -u www-data /usr/bin/php /var/www/html/owncloud/occ "\$@"
EOM