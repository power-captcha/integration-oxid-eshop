<?php

declare(strict_types=1);

namespace PowerCaptcha\OxidEshop;

final class Module
{
    public const MODULE_ID = 'power_captcha';

    // Versions
    public const API_VERSION = 'v1';
    public const JS_VERSION = '1.2.5';

    // Defaults
    public const DEFAULT_ENDPOINT_BASE_URL = 'https://api.power-captcha.com';
    public const DEFAULT_JAVASCRIPT_BASE_URL = 'https://cdn.power-captcha.com';
    public const DEFAULT_CHECK_MODE = self::CHECK_MODE_OPTION_AUTO;
    public const DEFAULT_API_ERROR_POLICY = self::API_ERROR_POLICY_GRANT_ACCESS;
    
    // Check mode options
    public const CHECK_MODE_OPTION_AUTO = 'auto';
    public const CHECK_MODE_OPTION_MANU = 'manu';
    public const CHECK_MODE_OPTION_HIDDEN = 'hidden';

    // Api error policy options
    public const API_ERROR_POLICY_GRANT_ACCESS = 'grantAccess';
    public const API_ERROR_POLICY_BLOCK_ACCESS = 'blockAccess';

    // Settings names
    // General settings
    public const SETTING_GROUP_GENERAL = 'power_captcha_general';

    public const SETTING_NAME_API_KEY = 'power_captcha_ApiKey';

    public const SETTING_NAME_SECRET_KEY = 'power_captcha_SecretKey';

    public const SETTING_NAME_CHECK_MODE = 'power_captcha_CheckMode';

    public const SETTING_NAME_API_ERROR_POLICY = 'power_captcha_ApiErrorPolicy';

    public const SETTING_NAME_DEBUG_MODE = 'power_captcha_DebugMode';

    // Protected sections
    public const SETTING_GROUP_PROTECTED_SECTIONS = 'power_captcha_protected_sections';

    public const SETTING_NAME_PROTECT_LOGIN = 'power_captcha_ProtectLogin';

    public const SETTING_NAME_PROTECT_REGISTER = 'power_captcha_ProtectRegister';

    public const SETTING_NAME_PROTECT_CHECKOUT = 'power_captcha_ProtectCheckout';

    public const SETTING_NAME_PROTECT_CONTACT = 'power_captcha_ProtectContact';

    public const SETTING_NAME_PROTECT_FORGOTPWD = 'power_captcha_ProtectForgotPwd';

    public const SETTING_NAME_PROTECT_NEWSLETTER = 'power_captcha_ProtectNewsletter';

    public const SETTING_NAME_PROTECT_WISHEDPRICE = 'power_captcha_ProtectWishedPrice';

    // On-premises settings
    public const SETTING_GROUP_ONPREMISES = 'power_captcha_onpremises';

    public const SETTING_NAME_ENDPOINT_BASE_URL = 'power_captcha_EndpointBaseUrl';

    public const SETTING_NAME_JAVASCRIPT_BASE_URL = 'power_captcha_JavaScriptBaseUrl';

}
