# POWER CAPTCHA Integration for OXID eShop

[POWER CAPTCHA](https://power-captcha.com/en/) protects your OXID eShop against bots and unauthorized persons. GDPR compliant!

This OXID eShop Module integrates POWER CAPTCHA to
* Customer login form
* Checkout form
<!-- TODO add more integrations versions -->

## Compatibility

* Compatible with OXID eShop 7.1.x.
<!-- TODO test and add more compatible versions -->

## Setup

### 1. Installation

This module can be installed via composer:
  ```
  cd <shopRoot>
  composer require power-captcha/integration-oxid
  ```

### 2. Activation
After the installation the next step is to activate the module. This can be done via the command or via the admin panel.

#### Activation via command

You can activate the module using the OXID eShop console. The commands should be executed in the shopRoot directory:

```bash
vendor/bin/oe-console oe:module:activate power_captcha
```

If the module should only be activated for a sub shop, use the following command (replace `<shop-id>` with the desired shop id)

```bash
vendor/bin/oe-console oe:module:activate power_captcha --shop-id <shop-id>
```

#### Activation via admin panel
Login into your OXID eShop admininstration panel and navigate to Extensions ‣ Modules. Choose the POWER CAPTCHA module and click the activate button.

### 3. Configuration

TODO


## Development

### Installation for development

1. Clone the module to `<shopRoot>/dev/power-captcha/integration-oxid-eshop`:
    ```bash
    cd <shopRoot>
    git clone https://github.com/power-captcha/integration-oxid-eshop dev/power-captcha/integration-oxid-eshop
    ```

2. Add and require the module from the local path via Composer:
    ```bash
    cd <shopRoot>
    composer config repositories.power-captcha/integration-eshop path ./dev/power-captcha/integration-oxid-eshop
    composer require power-captcha/integration-oxid-eshop:*
    ```

3. Install and activate the module using the OXID eShop console:
    ```bash
    cd <shopRoot>
    vendor/bin/oe-console oe:module:install vendor/power-captcha/integration-oxid-eshop
    vendor/bin/oe-console oe:module:activate power_captcha
    ```

3. Activate the module:
    ```bash
    cd <shopRoot>
    bin/oe-console oe:module:activate power_captcha
    ```

### Useful commands

* Reinstalling the module

  After making changes, it is necessary to reinstall the module for the changes to take effect:
  ```bash
  cd <shopRoot>
  vendor/bin/oe-console oe:module:install vendor/power-captcha/integration-oxid-eshop
  ```

* Reactivating the module

  If you make changes to `services.yaml` (e.g. adding more services) or `metadata.php` (e.g. extending new OXID eShop components), you may need to reactivate the module:
  ```bash
  cd <shopRoot>
  vendor/bin/oe-console oe:module:activate power_captcha
  ```

* Clearing the cache

  You can clear the cache with 
  ```bash
  cd <shopRoot>
  vendor/bin/oe-console oe:cache:clear
  ```


### Helpful links
* [OXID eShop development docs](https://docs.oxid-esales.com/developer/en/latest/development/modules_components_themes/index.html)
* [OXID module template](https://github.com/OXID-eSales/module-template)
