#!/bin/bash
echo "Setting up WordPress..."

# Use simple localhost URLs - HTTP_HOST fix in docker-compose handles Codespaces
BASE_URL="http://localhost"
PHPMYADMIN_URL="http://localhost:8080"

# Wait for database
sleep 15

echo "Installing WordPress..."
cd /var/www/html

echo "Installing WordPress at: $BASE_URL"

wp core install \
    --url="$BASE_URL" \
    --title="WordPress Dev" \
    --admin_user="admin" \
    --admin_password="admin" \
    --admin_email="admin@example.com" \
    --skip-email \
    --allow-root

echo "WordPress installed!"

# Remove default plugins that aren't needed for development
echo "Removing default plugins..."
wp plugin delete akismet --allow-root 2>/dev/null || true
wp plugin delete hello --allow-root 2>/dev/null || true

# Import WordPress sample data for development
echo "Importing sample content..."
wp plugin install wordpress-importer --activate --allow-root

# Download official WordPress theme unit test data
curl -O https://raw.githubusercontent.com/WPTT/theme-unit-test/master/themeunittestdata.wordpress.xml

# Import the sample data
wp import themeunittestdata.wordpress.xml --authors=create --allow-root

# Clean up the XML file
rm themeunittestdata.wordpress.xml

echo "Sample content imported!"

# Install WordPress Create Block tool globally
npm install -g @wordpress/create-block

echo "WordPress setup complete!"
echo "Ready at: $BASE_URL"
echo "Admin: $BASE_URL/wp-admin (admin/admin)"
echo "phpMyAdmin: $PHPMYADMIN_URL"
