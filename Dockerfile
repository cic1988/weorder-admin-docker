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

RUN apt-get update && \
    apt-get install -y wget unzip && \
    rm -rf /var/lib/apt/lists/* && \
    wget -O woocomerce.zip https://downloads.wordpress.org/plugin/woocommerce.3.7.0.zip && \
    unzip woocomerce.zip

