# WordPress Development Template for Github Codespaces

A comprehensive Docker-based development environment for WordPress plugin and theme development, optimized for GitHub Codespaces and local development.

[![Open in GitHub Codespaces](https://github.com/codespaces/badge.svg)](https://codespaces.new/your-username/your-repo-name)

## 🚀 Quick Start

### Using GitHub Codespaces
1. Click "Use this template" → "Create a new repository"
2. Open your new repository and click "Code" → "Create codespace on main"
3. Wait for the environment to set up automatically
4. Access your WordPress site at the forwarded port (usually port 8000)

### Local Development with VS Code
1. Clone this repository
2. Open in VS Code with Dev Containers extension installed
3. Click "Reopen in Container" when prompted
4. Wait for the setup to complete

## 🔧 Environment Setup

**Stack:** WordPress + MariaDB + phpMyAdmin + WP-CLI + Node.js + VS Code extensions

**Access URLs:**
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
wp search-replace "old-url.com" "localhost:8000" --allow-root

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