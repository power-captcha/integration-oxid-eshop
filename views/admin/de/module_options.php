<?php

declare(strict_types=1);

$aLang = [
    'charset' => 'UTF-8',

    // General settings
    'SHOP_MODULE_GROUP_power_captcha_general'  => 'Allgemeine Einstellungen',

    'SHOP_MODULE_power_captcha_ApiKey'         => 'API-Key <strong>(erforderlich)</strong>',
    'HELP_SHOP_MODULE_power_captcha_ApiKey'    => 'Gib deinen POWER CAPTCHA API-Key ein. Den API-Key findest du im <a href="https://power-captcha.com/mein-konto/api-keys/" target="_blank">API-Key Management</a>.',
    
    'SHOP_MODULE_power_captcha_SecretKey'      => 'Secret-Key <strong>(erforderlich)</strong>',
    'HELP_SHOP_MODULE_power_captcha_SecretKey' => 'Gib deinen POWER CAPTCHA Secret-Key ein. Den Secret-Key findest du im <a href="https://power-captcha.com/mein-konto/api-keys/" target="_blank">API-Key Management</a>.',
    
    'SHOP_MODULE_power_captcha_CheckMode'      => 'Prüfmodus (optional)',
    'HELP_SHOP_MODULE_power_captcha_CheckMode' =>
        '<p>Konfiguriert die Anzeige des Widgets und das Verhalten der Sicherheitsprüfung.</p>
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

    'SHOP_MODULE_power_captcha_ApiErrorPolicy'   => 'Richtlinie bei API-Fehlern (optional)',
    'HELP_SHOP_MODULE_power_captcha_ApiErrorPolicy'   => '
        <p>Konfiguriert das Verhalten bei Fehlern während der Token-Verifizierung über die POWER CAPTCHA API (z.B. bei Verbindungsproblemen zur API oder fehlerhafter Konfiguration).</p>
        <ul>
            <li>
                <strong>Zugriff erlauben</strong> (Standard):
                Der Zugriff wird erlaubt, falls ein API-Fehler auftritt.
            </li>
            <li>
                <strong>Zugriff blockieren</strong>:
                Der Zugriff wird blockiert, falls ein API-Fehler auftritt. Es wird eine Fehlermeldung angezeigt, die dazu auffordert, es später erneut zu versuchen.
            </li>
        </ul>
        <p>Hinweis: Fehlermeldungen werden unabhänging von dieser Einstellung immer im Log protokolliert.</p>
        ',
    'SHOP_MODULE_power_captcha_ApiErrorPolicy_grantAccess'   => 'Zugriff erlauben',
    'SHOP_MODULE_power_captcha_ApiErrorPolicy_blockAccess'   => 'Zugriff blockieren',

    'SHOP_MODULE_power_captcha_DebugMode'        => 'Debug-Modus (optional)',
    'HELP_SHOP_MODULE_power_captcha_DebugMode'   => 'Der Debug-Modus aktiviert die Log-Ausgabe in der Browser-Konsole.',
    
    // Protected sections
    'SHOP_MODULE_GROUP_power_captcha_protected_sections' => 'Geschützte Bereiche / Formulare',

    'SHOP_MODULE_power_captcha_ProtectLogin'            => 'Login-Formulare',
    'HELP_SHOP_MODULE_power_captcha_ProtectLogin'       => 'Schutz in Login-Formularen aktivieren (Anmeldung auf der <i>Mein Konto</i>-Seite, Anmeldung während der Bestellung, Login-Box)',

    'SHOP_MODULE_power_captcha_ProtectRegister'         => 'Registrierungsformulare',
    'HELP_SHOP_MODULE_power_captcha_ProtectRegister'    => 'Schutz in Registrierungsformularen aktivieren (Registrierung auf der <i>Konto eröffnen</i>-Seite, Registrierung während der Bestellung)',

    'SHOP_MODULE_power_captcha_ProtectCheckout'         => 'Abschluss der Bestellung',
    'HELP_SHOP_MODULE_power_captcha_ProtectCheckout'    => 'Schutz für den Abschluss von Bestellungen aktivieren',

    'SHOP_MODULE_power_captcha_ProtectContact'          => 'Kontaktformular',
    'HELP_SHOP_MODULE_power_captcha_ProtectContact'     => 'Schutz im Kontaktformular aktivieren',

    'SHOP_MODULE_power_captcha_ProtectForgotPwd'          => 'Formular zum Zurücksetzen des Passworts',
    'HELP_SHOP_MODULE_power_captcha_ProtectForgotPwd'     => 'Schutz im Formular zum Zurücksetzen des Passworts (<i>Passwort vergessen</i>-Seite) aktivieren',

    'SHOP_MODULE_power_captcha_ProtectNewsletter'          => 'Newsletterformular',
    'HELP_SHOP_MODULE_power_captcha_ProtectNewsletter'     => 'Schutz im Newsletterformular (An- und Abmeldung) aktivieren',

    'SHOP_MODULE_power_captcha_ProtectWishedPrice'         => 'Wunschpreis-Formular',
    'HELP_SHOP_MODULE_power_captcha_ProtectWishedPrice'    => 'Schutz im Wunschpreis-Formular (ehemals Preisalarm) aktivieren',

    // On-premises settings
    'SHOP_MODULE_GROUP_power_captcha_onpremises'            => 'On-Premises Einstellungen',

    'SHOP_MODULE_power_captcha_EndpointBaseUrl'           => 'Basis-URL des Endpunktes (optional)',
    'HELP_SHOP_MODULE_power_captcha_EndpointBaseUrl'      => 'Nur erforderlich, wenn du eine On-Premises-Lösung mit selbst gehostetem POWER CAPTCHA Endpunkt hast.',
    
    'SHOP_MODULE_power_captcha_JavaScriptBaseUrl'         => 'JavaScript Basis-URL (optional)',
    'HELP_SHOP_MODULE_power_captcha_JavaScriptBaseUrl'    => 'Nur erforderlich, wenn du eine On-Premises-Lösung mit selbst gehostetem POWER CAPTCHA-JavaScript hast.',

];