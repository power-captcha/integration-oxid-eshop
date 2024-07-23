<?php

declare(strict_types=1);

namespace PowerCaptcha\OxidEshop\Service;

interface ModuleSettingsInterface
{

    // General settings
    public const SETTING_GROUP_GENERAL = 'power_captcha_general';

    public const SETTING_NAME_API_KEY = 'power_captcha_ApiKey';

    public const SETTING_NAME_SECRET_KEY = 'power_captcha_SecretKey';

    // On-premises settings
    public const SETTING_GROUP_ONPREMISES = 'power_captcha_onpremises';

    public const SETTING_NAME_ENDPOINT_BASE_URL = 'power_captcha_EndpointBaseUrl';

    public const SETTING_NAME_JAVASCRIPT_BASE_URL = 'power_captcha_JavaScriptBaseUrl';


    // public const GREETING_MODE_GENERIC = 'generic';

    // public const GREETING_MODE_PERSONAL = 'personal';

    // public const LOGGER_STATUS = 'oemoduletemplate_LoggerEnabled';

    // public function isPersonalGreetingMode(): bool;

    // public function getGreetingMode(): string;

    // public function saveGreetingMode(string $value): void;

    // public function isLoggingEnabled(): bool;

    public function isConfigured(): bool;

    public function getApiKey(): string;

    // public function saveApiKey(string $value): void;

    public function getSecretKey(): string;

    // public function saveSecretKey(string $value): void;

    public function getClientUid(): string;

    public function getTokenRequestUrl(): string;

    public function getTokenVerificationUrl(): string;

    public function getJavaScriptUrl(): string;
}
