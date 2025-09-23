FROM wordpress:latest

# Install WP-CLI
RUN curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar \
    && chmod +x wp-cli.phar \
    && mv wp-cli.phar /usr/local/bin/wp

# Install additional tools for development
RUN apt-get update && apt-get install -y \
    vim \
    nano \
    mysql-client \
    && rm -rf /var/lib/apt/lists/*