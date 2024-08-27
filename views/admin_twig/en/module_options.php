<?php

declare(strict_types=1);

$aLang = [
    'charset' => 'UTF-8',

    // General settings
    'SHOP_MODULE_GROUP_power_captcha_general'   => 'General settings',
    
    'SHOP_MODULE_power_captcha_api_key'         => 'API Key <strong>(required)</strong>',
    'HELP_SHOP_MODULE_power_captcha_api_key'    => 'Enter your POWER CAPTCHA API Key. Find your API Key in the <a href="https://power-captcha.com/en/my-account/api-keys/" target="_blank">API Key Management</a>.',
    
    'SHOP_MODULE_power_captcha_secret_key'      => 'Secret Key <strong>(required)</strong>',
    'HELP_SHOP_MODULE_power_captcha_secret_key' => 'Enter your POWER CAPTCHA Secret Key. Find your Secret Key in the <a href="https://power-captcha.com/en/my-account/api-keys/" target="_blank">API Key Management</a>.',
    
    'SHOP_MODULE_power_captcha_CheckMode'       => 'Check mode (optional)',
    'HELP_SHOP_MODULE_power_captcha_CheckMode'  =>
        '<p>Configure the display of the widget and the behaviour of the security check.</p>
        <p>There are three options:
        <ul>
            <li>
                <strong>Automatic</strong> (default):
                The widget is always displayed and the security check is started automatically as soon as the form is filled in 
                or after the corresponding field (e.g. user name or email address) has been filled in. 
                A click on the checkbox in the widget is only necessary if it is required to solve a captcha.
            </li>
            <li>
                <strong>Hidden</strong>:
                The widget is not displayed initially and the security check is started automatically as soon as the form is filled in 
                or after the corresponding field (e.g. user name or e-mail address) has been filled in. 
                The widget is only displayed if it is required to solve a captcha.
            </li>
            <li><strong>Manual</strong>:
                The widget is always displayed and the security check is only started when the checkbox in the widget is clicked.
            </li>
        </ul></p>',
    'SHOP_MODULE_power_captcha_CheckMode_auto'   => 'Automatic',
    'SHOP_MODULE_power_captcha_CheckMode_hidden' => 'Hidden',
    'SHOP_MODULE_power_captcha_CheckMode_manu'   => 'Manual',
    
    'SHOP_MODULE_power_captcha_ApiErrorPolicy'   => 'API Error Policy (optional)',
    'HELP_SHOP_MODULE_power_captcha_ApiErrorPolicy'   => '
        <p>Configure the behaviour in the case of errors during token verification via the POWER CAPTCHA API (e.g. connection problems to the API or incorrect configuration).</p>
        <ul>
            <li>
                <strong>Grant access</strong> (default):
                Access is granted if an API error occurs.
            </li>
            <li>
                <strong>Block access</strong>:
                Access is blocked if an API error occurs. An error message is displayed requesting the user to try again later.
            </li>
        </ul>
        <p>Note: Error messages are always logged regardless of this setting.</p>
        ',
    'SHOP_MODULE_power_captcha_ApiErrorPolicy_grantAccess'   => 'Grant access',
    'SHOP_MODULE_power_captcha_ApiErrorPolicy_blockAccess'   => 'Block access',


    'SHOP_MODULE_power_captcha_DebugMode'        => 'Debug mode (optional)',
    'HELP_SHOP_MODULE_power_captcha_DebugMode'   => 'Debug mode enables the log output in the browser console.',

    // Protected sections
    'SHOP_MODULE_GROUP_power_captcha_protected_sections' => 'Protected sections / forms',

    'SHOP_MODULE_power_captcha_ProtectLogin'            => 'Login forms',
    'HELP_SHOP_MODULE_power_captcha_ProtectLogin'       => 'Activate protection in login forms (login on the <i>My Account</i> page, login during the checkout process, login box)',

    'SHOP_MODULE_power_captcha_ProtectRegister'         => 'Registration forms',
    'HELP_SHOP_MODULE_power_captcha_ProtectRegister'    => 'Activate protection in registration forms (registration on the <i>Open account</i> page, registration during the checkout process)',

    'SHOP_MODULE_power_captcha_ProtectCheckout'         => 'Checkout completion',
    'HELP_SHOP_MODULE_power_captcha_ProtectCheckout'    => 'Activate protection for the completion of the checkout',

    'SHOP_MODULE_power_captcha_ProtectContact'          => 'Contact form',
    'HELP_SHOP_MODULE_power_captcha_ProtectContact'     => 'Activate protection in the contact form',

    // On-premises settings
    'SHOP_MODULE_GROUP_power_captcha_onpremises'            => 'On-premise settings',
    
    'SHOP_MODULE_power_captcha_EndpointBaseUrl'           => 'Endpoint base URL (optional)',
    'HELP_SHOP_MODULE_power_captcha_EndpointBaseUrl'      => 'Only needed if you have an on-premises version with self-hosted POWER CAPTCHA endpoint.',
    
    'SHOP_MODULE_power_captcha_JavascriptBaseUrl'         => 'JavaScript base URL (optional)',
    'HELP_SHOP_MODULE_power_captcha_JavascriptBaseUrl'    => 'Only needed if you have an on-premises version with self-hosted POWER CAPTCHA JavaScript.',
    
];
