# WooCommerce Setup Guide
## Introduction
Setting up WooCommerce with Wordpress involves configuring a lot of settings. Instead of searching through an abundance of files where these would be set and including them in the project, we have instead opted for writing down the steps taken to set up the front-end for this project. The product images for the WooCommerce shop can be found in the Images folder.

## Steps
### Installing Plugins
- Go to Plugins -> Add New -> Search for "WooCommerce" -> Install Now -> Activate
- Go to Appearance -> Themes -> Activate "Astra" (Add if not present)

### General Wordpress Setup
- Go to Settings -> 
    - Permalinks -> Select "Day and name" under Common Settings
    - Reading -> 
        - Set homepage to static and Shop
        - Set post pages to Blog
- Go to Pages -> Add New -> Add the following:
    - Contact Us
    - About Us
    - Blog
- Go to Appearance ->
    - Menus -> Create a new menu (Main) -> Add all pages but checkout, homepage and testpage
    - Customize ->
        - Header Builder -> Site Title & Logo ->
            - Set Logo to Logo.png 
            - Set Site Title to "Tupperware"
        - WooCommerce -> 
            - Product Catalog -> Make Category invisible
            - Single Product -> Make Category invisible
            - Misc -> Enable Quantity Plus and Minus
        - Menus -> Main -> Set order to:
            1. Shop
            2. Blog
            3. About Us
            4. Contact Us
            5. Cart
            6. My Account
    - Publish before exiting

### Setup WooCommerce
- Go to WooCommerce -> Settings -> Payments -> Enable "Cash on delivery"
- Go to WooCommerce -> General -> Currency Options -> Set Currency to DKK
- Go to WooCommerce -> Settings -> Products -> Measurements -> Set weight to kg and Dimensions to cm

### Setup WooCommerce Products
- Go to Products -> Add New -> 
    1. Tupperware1.jpg - Tupperware Container (Small) - 200 kr
    2. Tupperware2.jpg - Tupperware Container (Extra Large) - 500 kr
    3. Tupperware3.jpg - Tupperware Container (Medium) - 250 kr
    4. Tupperware4.jpg - Tupperware Container (Large) - 350 kr
    5. Tupperware5.jpg - Tupperware Container (Tiny) - 150 kr
    - Publish before exiting

### Setup WooCommerce REST API
- Go to WooCommerce -> Settings -> Advanced ->
    - REST API -> Add Key (Remember to save both key and secret)
    - Legacy API -> Enable the Legacy REST API

### Deal with HTTP / HTTPS Issues
Since this project is purely for educational purposes, we apply this setting to ensure no issues with HTTPS
- Open the file .htaccess located in <XAMPP Folder>/htdocs/<Wordpress project name>