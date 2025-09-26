# WordPress Development Template for Github Codespaces

A comprehensive Docker-based development environment for WordPress plugin and theme development, optimized for GitHub Codespaces and local development.

## ⚠️ Important Notice

**Currently only works with VS Code Desktop!** 
Due to WordPress's URL hardcoded url handling and Codespace redirect mechanisms, this template does not work properly in the browser-based VS Code. You must use VS Code Desktop with the GitHub Codespaces extension to properly access WordPress on localhost. Maybe someone can provide a pull request to fix? I failed so far...


[![Open in GitHub Codespaces](https://github.com/codespaces/badge.svg)](https://codespaces.new/eetezadi/Codespaces-Wordpress-Development)

## 🚀 Quick Start

### Using GitHub Codespaces
1. Click "Use this template" → "Create a new repository"
2. Open your new repository and click "Code" → "Create codespace on main"
3. Wait for the environment to set up automatically
4. Start developing in the wp-content folder

## 🔧 Environment Setup

**Stack:** WordPress + MariaDB + phpMyAdmin + WP-CLI + Node.js + VS Code extensions

**Access URLs:**

*Local Development:*
- WordPress: http://localhost:8000 (admin/admin)
- phpMyAdmin: http://localhost:8080 (wordpress/wordpress)

**Includes:** Sample data, theme unit tests, and @wordpress/create-block tool ready to use.

**File Structure:**
```
├── .devcontainer/    # Container configuration
├── wp-content/       # Your plugins & themes
└── wp-core/         # WordPress core (auto-generated)
```

## 🛠️ Development Guide

### Gutenberg Blocks (Recommended)
```bash
cd wp-content/plugins
npx @wordpress/create-block my-block
cd my-block && npm start
```
Creates a modern React-based block with hot reloading.

### Custom Plugins
```bash
mkdir wp-content/plugins/my-plugin
cd wp-content/plugins/my-plugin
# Create your plugin files
wp plugin activate my-plugin --allow-root
```

### Custom Themes
```bash
mkdir wp-content/themes/my-theme
cd wp-content/themes/my-theme
# Create style.css and index.php
wp theme activate my-theme --allow-root
```

## 💡 Useful WP-CLI Commands

```bash
# Plugin management
wp plugin list --allow-root
wp plugin activate plugin-name --allow-root
wp plugin deactivate plugin-name --allow-root

# Theme management
wp theme list --allow-root
wp theme activate theme-name --allow-root

# Database operations
wp db search "old-url" --allow-root
wp search-replace "old-url.com" "new-url.com" --allow-root

# User management
wp user list --allow-root
wp user create newuser user@example.com --role=administrator --allow-root

# Clear cache and flush rewrite rules
wp cache flush --allow-root
wp rewrite flush --allow-root
```

## 📝 Notes

- Only commit files in `wp-content/plugins/` and `wp-content/themes/`
- WordPress core files (`wp-core/`) are ignored by Git
- Database persists between restarts

## 🤝 Contributing

1. Fork this repository
2. Create your feature branch
3. Test your changes thoroughly
4. Submit a pull request

## 📄 License

This template is open source and available under the [MIT License](LICENSE).

---

Built with ❤️ by [@eetezadi](https://github.com/eetezadi)