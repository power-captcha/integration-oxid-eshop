<?php

/**
 * Copyright © POWER CAPTCHA. All rights reserved.
 * See LICENSE file for license details.
 */
use PowerCaptcha\OxidEshop\Service\ModuleSettingsInterface as Settings;
/**
 * Metadata version
 */
$sMetadataVersion = '2.1';

/**
 * Module information
 */
$aModule = [
    'id'          => 'power_captcha',
    'title'       => [
        'en' => 'POWER CAPTCHA Integration for OXID eShop',
        'de' => 'POWER CAPTCHA Integration für OXID eShop'
    ],
    'description' =>  [ // TODO check description
        'en' => 'POWER CAPTCHA protects your OXID eShop against bots and unauthorized persons. GDPR compliant!',
        'de' => 'POWER CAPTCHA schützt deinen OXID eShop gegen Bots und unberechtigte Personen. DSGVO-konform!'
    ], 
    'thumbnail'   => 'pictures/logo.png',
    'version'     => '0.0.1',
    'author'      => 'POWER CAPTCHA',
    'url'         => 'https://power-captcha.com/en',
    // 'email'       => '', // TODO email
    'extend'      => [
        OxidEsales\Eshop\Core\ViewConfig::class => PowerCaptcha\OxidEshop\Core\ViewConfig::class,
        OxidEsales\Eshop\Application\Component\UserComponent::class => PowerCaptcha\OxidEshop\Component\UserComponent::class,
        OxidEsales\Eshop\Application\Controller\OrderController::class => PowerCaptcha\OxidEshop\Controller\OrderController::class,
    ],
    'controllers' => [
    ],
    'settings' => [
        /** General settings */
        [
            'group'       => Settings::SETTING_GROUP_GENERAL,
            'name'        => Settings::SETTING_NAME_API_KEY,
            'type'        => 'str',
            // 'constraints' => 'generic|personal', //TODO mandatory constraint?
            'value'       => ''
        ],
        [
            'group'       => Settings::SETTING_GROUP_GENERAL,
            'name'        => Settings::SETTING_NAME_SECRET_KEY,
            'type'        => 'str', 
            // 'constraints' => 'generic|personal',
            'value'       => ''
        ],
        //TODO: add help texts for settings to explain possibilities and point out which ones only serve as example
        // /** Main */
        // [
        //     'group'       => 'oemoduletemplate_main',
        //     'name'        => 'oemoduletemplate_GreetingMode',
        //     'type'        => 'select',
        //     'constraints' => 'generic|personal',
        //     'value'       => 'generic'
        // ],
        // [
        //     'group' => 'oemoduletemplate_main',
        //     'name'  => 'oemoduletemplate_BrandName',
        //     'type'  => 'str',
        //     'value' => 'Testshop'
        // ],
        // [
        //     'group' => 'oemoduletemplate_main',
        //     'name'  => 'oemoduletemplate_LoggerEnabled',
        //     'type'  => 'bool',
        //     'value' => false
        // ],
        // [
        //     'group' => 'oemoduletemplate_main',
        //     'name'  => 'oemoduletemplate_Timeout',
        //     'type'  => 'num',
        //     'value' => 30
        //     //'value' => 30.5
        // ],
        // [
        //     'group' => 'oemoduletemplate_main',
        //     'name'  => 'oemoduletemplate_Categories',
        //     'type'  => 'arr',
        //     'value' => ['Sales', 'Manufacturers']
        // ],
        // [
        //     'group' => 'oemoduletemplate_main',
        //     'name'  => 'oemoduletemplate_Channels',
        //     'type'  => 'aarr',
        //     'value' => ['1' => 'de', '2' => 'en']
        // ],
        // [
        //     'group'    => 'oemoduletemplate_main',
        //     'name'     => 'oemoduletemplate_Password',
        //     'type'     => 'password',
        //     'value'    => 'changeMe',
        //     'position' => 3
        // ]
    ],
];
