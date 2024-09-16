# POWER CAPTCHA Integration for OXID eShop

[POWER CAPTCHA](https://power-captcha.com/en/) protects your OXID eShop against bots and unauthorized persons. GDPR compliant!

This OXID eShop Module integrates POWER CAPTCHA into:
* Customer login forms
* Registration forms
* Checkout completion
* Contact form
* Password reset form
* Newsletter form
* Wished price form

## Compatibility

Compatible with OXID eShop 7.1.x. Ready to use with the default APEX theme and easily integrable into other (custom) themes.

## Installation and Configuration

### 1. Install the Module

To install the module, use composer:
  ```
  cd <shopRoot>
  composer require power-captcha/integration-oxid-eshop
  ```

### 2. Activate the Module
Once installed, activate the module through the admin panel or via command line.

#### Activation via Admin Panel
Log in into your OXID eShop admin panel and navigate to **Extensions ⇨ Modules**. Select the POWER CAPTCHA module and click the **Activate button**.

#### Activation via Command Line

You can also  activate the module using the OXID eShop console. Run the following command from your shop root directory:

```bash
vendor/bin/oe-console oe:module:activate power_captcha
```

If you need to activate the module for a specific sub-shop, use the following command (replacing `<shop-id>` with the actual shop ID):

```bash
vendor/bin/oe-console oe:module:activate power_captcha --shop-id <shop-id>
```

### 3. Configure the Module

Log in into your OXID eShop admin panel and navigate to **Extensions ⇨ Modules**. Select the POWER CAPTCHA module and click the **Settings tab**.

#### General settings

Enter your **API Key** and **Secret Key**, both keys can be found in the [API Key Management](https://power-captcha.com/en/my-account/api-keys/) of POWER CAPTCHA. If don't have an API Key yet, you can choose a plan on [power-captcha.com](https://power-captcha.com/en/). 

Other general settings are optional.

#### Protected sections / forms

Here you can select which sections / forms in your shop should be protected by POWER CAPTCHA.

#### On-premise settings

These settings are only relevant if you are running a self-hosted POWER CAPTCHA instance. If not, you can leave these fields blank.

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
    composer config repositories.power-captcha/integration-oxid-eshop path ./dev/power-captcha/integration-oxid-eshop
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