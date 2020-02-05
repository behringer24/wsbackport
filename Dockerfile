FROM debian:10-slim
LABEL maintainer="Andreas Behringer <kontakt@behringer24.de>"

# Set PHP install sources
RUN apt-get update && \
    apt-get install -y --no-install-recommends ca-certificates apt-transport-https wget gnupg2 && \
    wget -q https://packages.sury.org/php/apt.gpg -O- | apt-key add - && \
    echo "deb https://packages.sury.org/php/ buster main" | tee /etc/apt/sources.list.d/php.list && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/* /var/cache/apt/archive/*.deb

# Install and clean up afterwards
RUN apt-get update && \
    apt-get install -y --no-install-recommends \
        apache2 \
        php5.6 \
        php5.6-json \
        php5.6-curl \
        php5.6-gd \
        php5.6-mbstring \
        php5.6-mcrypt \
        php5.6-xml \
        php5.6-mysql \
        php-apcu && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/* /var/cache/apt/archive/*.deb

# Enable mod rewrite
RUN a2enmod rewrite

# Copy Sources to container
ADD ./html/ /var/www/html

# Copy VHost conf to container
ADD ./apache2-conf/000-default.conf /etc/apache2/sites-available

# Expose port 80
EXPOSE 80

# Launch Apache in foreground mode
CMD ["/usr/sbin/apache2ctl", "-DFOREGROUND"]
