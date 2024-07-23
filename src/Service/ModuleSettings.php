<?php

declare(strict_types=1);

namespace PowerCaptcha\OxidEshop\Service;

use OxidEsales\EshopCommunity\Internal\Framework\Module\Facade\ModuleSettingServiceInterface;
use PowerCaptcha\OxidEshop\Module;

/**
 * @extendable-class
 */
class ModuleSettings implements ModuleSettingsInterface
{
    public function __construct(
        private ModuleSettingServiceInterface $moduleSettingService
    ) {
    }

    public function isConfigured(): bool
    {
        return !empty($this->getApiKey()) && !empty($this->getSecretKey());
    }

    public function getApiKey(): string
    {
        return $this->getSettingString(Module::SETTING_NAME_API_KEY);
    }

    public function getSecretKey(): string
    {
        return $this->getSettingString(Module::SETTING_NAME_SECRET_KEY);        
    }

    public function getCheckMode(): string
    {
        $checkMode = $this->getSettingString(Module::SETTING_NAME_CHECK_MODE, Module::DEFAULT_CHECK_MODE);
        if(in_array($checkMode, [Module::CHECK_MODE_OPTION_AUTO, Module::CHECK_MODE_OPTION_HIDDEN, Module::CHECK_MODE_OPTION_MANU])) {
            return $checkMode;
        }

        return Module::DEFAULT_CHECK_MODE;
    }

    public function getClientUid(): string
    {
        $ip = \OxidEsales\Eshop\Core\Registry::getUtilsServer()->getRemoteAddress();
        return (string) hash('sha256', $ip);
    }

    public function getJavaScriptUrl(): string
    {
        return $this->getJavaScriptBaseUrl() . '/' . Module::API_VERSION . '/power-captcha-' . Module::JS_VERSION . '.min.js';
    }

    public function getTokenRequestUrl(): string
    {
        return $this->getEndpointBaseUrl() . '/pc/' . Module::API_VERSION ;
    }

    public function getTokenVerificationUrl(): string
    {
        return $this->getEndpointBaseUrl() . '/pcu/' . Module::API_VERSION . '/verify';
    }

    public function getJavaScriptBaseUrl(): string
    {
        $url = $this->getSettingString(Module::SETTING_NAME_JAVASCRIPT_BASE_URL, Module::DEFAULT_JAVASCRIPT_BASE_URL);
        return $this->cleanTrailingSlash($url);
    }

    private function getEndpointBaseUrl(): string
    {
        $url = $this->getSettingString(Module::SETTING_NAME_ENDPOINT_BASE_URL, Module::DEFAULT_ENDPOINT_BASE_URL);
        return $this->cleanTrailingSlash($url);
    }

    private function cleanTrailingSlash(string $value): string {
        return rtrim($value, '/');
    }

    private function getSettingString(string $settingName, string $fallbackValue = ''): string
    {
        if($this->moduleSettingService->exists($settingName, Module::MODULE_ID)) {
            $settingValue = $this->moduleSettingService->getString($settingName, Module::MODULE_ID)->trim()->toString();
            if(!empty($settingValue)) {
                return $settingValue;
            }
        }
        return $fallbackValue;
    }

}
