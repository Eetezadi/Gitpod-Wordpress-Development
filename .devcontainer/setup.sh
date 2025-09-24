#!/bin/bash
echo "Setting up WordPress..."

# Wait for database
sleep 15

# Determine the site URL based on environment
if [ -n "$CODESPACE_NAME" ]; then
    SITE_URL="https://$CODESPACE_NAME-8000.app.github.dev"
else
    SITE_URL="http://localhost:8000"
fi

echo "Installing WordPress at $SITE_URL..."
cd /var/www/html
wp core install \
    --url="$SITE_URL" \
    --title="WordPress Dev" \
    --admin_user="admin" \
    --admin_password="admin" \
    --admin_email="admin@example.com" \
    --skip-email \
    --allow-root

# Update site URL and home in wp-config.php to support both URLs
wp option update home "$SITE_URL" --allow-root
wp option update siteurl "$SITE_URL" --allow-root

# Configure WordPress to work with both URLs
wp config set WP_HOME "isset(\$_SERVER['CODESPACE_NAME']) ? 'https://' . \$_SERVER['CODESPACE_NAME'] . '-8000.app.github.dev' : 'http://localhost:8000'" --raw --allow-root
wp config set WP_SITEURL "isset(\$_SERVER['CODESPACE_NAME']) ? 'https://' . \$_SERVER['CODESPACE_NAME'] . '-8000.app.github.dev' : 'http://localhost:8000'" --raw --allow-root

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

echo "Ready at: http://localhost:8000"
echo "Admin: http://localhost:8000/wp-admin (admin/admin)"
echo "phpMyAdmin: http://localhost:8080"
