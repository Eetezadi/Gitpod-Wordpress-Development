#!/bin/bash
echo "Setting up WordPress..."

# Function to get the correct base URL for the environment
get_base_url() {
    if [ "${CODESPACES}" = "true" ]; then
        echo "https://${CODESPACE_NAME}-80.${GITHUB_CODESPACES_PORT_FORWARDING_DOMAIN}"
    else
        echo "http://localhost:80"
    fi
}

# Function to get phpMyAdmin URL
get_phpmyadmin_url() {
    if [ "${CODESPACES}" = "true" ]; then
        echo "https://${CODESPACE_NAME}-8080.${GITHUB_CODESPACES_PORT_FORWARDING_DOMAIN}"
    else
        echo "http://localhost:8080"
    fi
}

# Wait for database
sleep 15

echo "Installing WordPress..."
cd /var/www/html

# Get the dynamic URL
BASE_URL=$(get_base_url)
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

# Show environment-appropriate URLs
BASE_URL=$(get_base_url)
PHPMYADMIN_URL=$(get_phpmyadmin_url)

echo "Ready at: $BASE_URL"
echo "Admin: $BASE_URL/wp-admin (admin/admin)"
echo "phpMyAdmin: $PHPMYADMIN_URL"
