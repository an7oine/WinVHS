if [ -f /etc/php5/php.ini ] && cmp -s /etc/defaults/etc/php5/php.ini /etc/php5/php.ini
then
    rm /etc/php5/php.ini
fi

