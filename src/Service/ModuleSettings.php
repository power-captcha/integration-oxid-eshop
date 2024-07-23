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
    private const API_VERSION = 'v1';
    private const JS_VERSION = '1.2.5'; // TODO release frontend version 1.2.5
    private const DEFAULT_ENDPOINT_BASE_URL = 'https://api.power-captcha.com';
    private const DEFAULT_JAVASCRIPT_BASE_URL = 'https://cdn.power-captcha.com';
    
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
        return $this->getSettingString(self::SETTING_NAME_API_KEY);
    }

    public function getSecretKey(): string
    {
        return $this->getSettingString(self::SETTING_NAME_SECRET_KEY);        
    }

    public function getClientUid(): string
    {
        $ip = \OxidEsales\Eshop\Core\Registry::getUtilsServer()->getRemoteAddress();
        return (string) hash('sha256', $ip);
    }

    public function getJavaScriptUrl(): string
    {
        return $this->getJavaScriptBaseUrl() . '/' . self::API_VERSION . '/power-captcha-' . self::JS_VERSION . '.min.js';
    }

    public function getTokenRequestUrl(): string
    {
        return $this->getEndpointBaseUrl() . '/pc/' . self::API_VERSION ;
    }

    public function getTokenVerificationUrl(): string
    {
        return $this->getEndpointBaseUrl() . '/pcu/' . self::API_VERSION . '/verify';
    }

    public function getJavaScriptBaseUrl(): string
    {
        $url = $this->getSettingString(self::SETTING_NAME_JAVASCRIPT_BASE_URL, self::DEFAULT_JAVASCRIPT_BASE_URL);
        return $this->cleanTrailingSlash($url);
    }

    private function getEndpointBaseUrl(): string
    {
        $url = $this->getSettingString(self::SETTING_NAME_ENDPOINT_BASE_URL, self::DEFAULT_ENDPOINT_BASE_URL);
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
