# Gitpod-Wordpress-Development
Template repository for Wordpress Plugin and Theme development

## Try or Contribute

[![Open in Gitpod](https://gitpod.io/button/open-in-gitpod.svg)](https://gitpod.io#https://github.com/Eetezadi/Gitpod-Wordpress-Development)

This is a template repo, you can create your own using this as a template. Or let Gitpod handle the fork on first commit.

## What this does

* Runs Wordpress on MariaDB on port 8000
* Runs PhpmyAdmin on port 8080 (user:wordpress, pass: wordpress)
* Installs WP-CLI in the wordpress container and pre-configures Wordpress (more option can be added in gitpod.yml)
* Exposes "wp-content" folder to Gitpod, so you can add your plugins and themes
* Exposes Wordpress files on "wp-core" (ignored in .gitognore)
* Includes Github Actions for automatic SemVer versioning

## What you can do
* Setup Wordpress and start developing...
* Use for your own project.