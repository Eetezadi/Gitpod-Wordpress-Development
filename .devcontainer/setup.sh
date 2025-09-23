#!/bin/bash
echo "Setting up WordPress..."

# Wait for database
sleep 15

# Install WordPress if not exists
if ! wp core is-installed --allow-root 2>/dev/null; then
    echo "Installing WordPress..."
    wp core install \
        --url="http://localhost:8000" \
        --title="WordPress Dev" \
        --admin_user="admin" \
        --admin_password="admin" \
        --admin_email="admin@example.com" \
        --skip-email \
        --allow-root

    # Install dev plugins
    wp plugin install query-monitor debug-bar --activate --allow-root
    
    echo "WordPress installed!"
else
    echo "WordPress already exists"
fi

echo "Ready at: http://localhost:8000"
echo "Admin: http://localhost:8000/wp-admin (admin/admin)"
echo "phpMyAdmin: http://localhost:8080"