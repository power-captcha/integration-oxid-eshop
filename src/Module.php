<?php

declare(strict_types=1);

namespace PowerCaptcha\OxidEshop;

final class Module
{
    public const MODULE_ID = 'power_captcha';

    // Versions
    public const API_VERSION = 'v1';
    public const JS_VERSION = '1.2.5'; // TODO release frontend version 1.2.5

    // Defaults
    public const DEFAULT_ENDPOINT_BASE_URL = 'https://api.power-captcha.com';
    public const DEFAULT_JAVASCRIPT_BASE_URL = 'https://cdn.power-captcha.com';

    // Settings
    // General settings
    public const SETTING_GROUP_GENERAL = 'power_captcha_general';

    public const SETTING_NAME_API_KEY = 'power_captcha_ApiKey';

    public const SETTING_NAME_SECRET_KEY = 'power_captcha_SecretKey';

    // On-premises settings
    public const SETTING_GROUP_ONPREMISES = 'power_captcha_onpremises';

    public const SETTING_NAME_ENDPOINT_BASE_URL = 'power_captcha_EndpointBaseUrl';

    public const SETTING_NAME_JAVASCRIPT_BASE_URL = 'power_captcha_JavaScriptBaseUrl';

}
