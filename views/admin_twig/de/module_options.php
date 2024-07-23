<?php

declare(strict_types=1);

$aLang = [
    'charset' => 'UTF-8',

    // General settings
    'SHOP_MODULE_GROUP_power_captcha_general'  => 'Allgemeine Einstellungen',
    'SHOP_MODULE_power_captcha_ApiKey'         => 'API-Key (erforderlich)',
    'HELP_SHOP_MODULE_power_captcha_ApiKey'    => 'Gib deinen POWER CAPTCHA API-Key ein. Den API-Key findest du im <a href="https://power-captcha.com/mein-konto/api-keys/" target="_blank">API-Key Management</a>.',
    'SHOP_MODULE_power_captcha_SecretKey'      => 'Secret-Key (erforderlich)',
    'HELP_SHOP_MODULE_power_captcha_SecretKey' => 'Gib deinen POWER CAPTCHA Secret-Key ein. Den Secret-Key findest du im <a href="https://power-captcha.com/mein-konto/api-keys/" target="_blank">API-Key Management</a>.',
    'SHOP_MODULE_power_captcha_CheckMode'      => 'Prüfmodus (optional)',
    'HELP_SHOP_MODULE_power_captcha_CheckMode' =>
        '<p>Konfiguriere die Anzeige des Widgets und das Verhalten der Sicherheitsprüfung.</p>
        <p>Es gibt drei Optionen:
        <ul>
            <li>
                <strong>Automatisch</strong> (Standard):
                Das Widget wird immer angezeigt und die Sicherheitsprüfung wird automatisch gestartet,
                sobald das Formular ausgefüllt wird oder nachdem das entsprechende Feld (z.B. Benutzername oder E-Mail-Adresse) ausgefüllt wurde. 
                Ein Klick auf die Checkbox im Widget ist nur notwendig, wenn ein Captcha gelöst werden muss.
            </li>
            <li>
                <strong>Versteckt</strong>:
                Das Widget wird zunächst nicht angezeigt und die Sicherheitsprüfung wird automatisch gestartet, 
                sobald das Formular ausgefüllt wird oder nachdem das entsprechende Feld (z. B. Benutzername oder E-Mail-Adresse) ausgefüllt wurde. 
                Das Widget wird nur eingeblendet, wenn ein Captcha gelöst werden muss.
            </li>
            <li><strong>Manuell</strong>:
                Das Widget wird immer angezeigt, und die Sicherheitsprüfung wird erst gestartet, wenn auf die Checkbox im Widget geklickt wird.
            </li>
        </ul></p>',
    'SHOP_MODULE_power_captcha_CheckMode_auto'   => 'Automatisch',
    'SHOP_MODULE_power_captcha_CheckMode_hidden' => 'Versteckt',
    'SHOP_MODULE_power_captcha_CheckMode_manu'   => 'Manuell',
    
    // On-premises settings
    'SHOP_MODULE_GROUP_power_captcha_onpremises'            => 'On-Premises Einstellungen',
    'SHOP_MODULE_power_captcha_EndpointBaseUrl'           => 'Basis-URL des Endpunktes (optional)',
    'HELP_SHOP_MODULE_power_captcha_EndpointBaseUrl'      => 'Nur erforderlich, wenn du eine On-Premises-Lösung mit selbst gehostetem POWER CAPTCHA Endpunkt hast.',
    'SHOP_MODULE_power_captcha_JavaScriptBaseUrl'         => 'JavaScript Basis-URL (optional)',
    'HELP_SHOP_MODULE_power_captcha_JavaScriptBaseUrl'    => 'Nur erforderlich, wenn du eine On-Premises-Lösung mit selbst gehostetem POWER CAPTCHA-JavaScript hast.',

];