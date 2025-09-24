#!/bin/bash
echo "Setting up WordPress..."

# Wait for database
sleep 15

# Install WordPress if not exists

echo "Installing WordPress..."
wp core install \
    --url="http://localhost:8000" \
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

echo "Ready at: http://localhost:8000"
echo "Admin: http://localhost:8000/wp-admin (admin/admin)"
echo "phpMyAdmin: http://localhost:8080"