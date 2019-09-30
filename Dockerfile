# ------------------------------------------------------
#                       Dockerfile
# ------------------------------------------------------
# image:    weorder-admin-docker
# name:     cic1988/weorder-admin-docker
# repo:     https://github.com/cic1988/weorder-admin-docker.git
# authors:  gaoyuanhot@gmail.com
# ------------------------------------------------------

FROM wordpress:latest

WORKDIR /var/www/html/wp-content/plugins

# 1) install needed app
RUN apt-get update && \
    apt-get install -y wget unzip && \
    rm -rf /var/lib/apt/lists/*

# 2) install woocommerce
RUN wget -O woocomerce.zip https://downloads.wordpress.org/plugin/woocommerce.3.7.0.zip && \
    unzip woocomerce.zip

# 3) install woocommerce-to-weorder
RUN curl -s https://api.github.com/repos/cic1988/weorder-admin-docker/releases/latest \
    | grep "browser_download_url.*zip" \
    | cut -d '"' -f 4 \
    | xargs wget -O woocomerce-to-weorder.zip && \
    unzip woocomerce-to-weorder.zip && \
    rm -rf *.zip

# 4) install JWT authentication
RUN wget -O jwt-authentication.zip https://downloads.wordpress.org/plugin/jwt-authentication-for-wp-rest-api.1.2.6.zip && \
    unzip jwt-authentication.zip
