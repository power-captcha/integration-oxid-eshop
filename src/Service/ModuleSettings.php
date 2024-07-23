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
    private const DEFAULT_ENDPOINT_BASE_URL = 'http://host.docker.internal:9088'; // TODO https://api.power-captcha.com
    private const DEFAULT_JAVASCRIPT_BASE_URL = 'http://localhost:8982/captcha-js'; // TODO https://cdn.power-captcha.com

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

    // public function saveApiKey(string $value): void
    // {
    //     $this->moduleSettingService->saveString(self::SETTING_NAME_API_KEY, $value, Module::MODULE_ID);
    // }

    public function getSecretKey(): string
    {
        return $this->getSettingString(self::SETTING_NAME_SECRET_KEY);        
    }

    // public function saveSecretKey(string $value): void
    // {
    //     $this->moduleSettingService->saveString(self::SETTING_NAME_SECRET_KEY, $value, Module::MODULE_ID);
    // }

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
        $url = self::DEFAULT_JAVASCRIPT_BASE_URL; // TODO add setting
        return $this->cleanTrailingSlash($url);
    }

    private function getEndpointBaseUrl(): string
    {
        $url = self::DEFAULT_ENDPOINT_BASE_URL; // TODO add setting
        return $this->cleanTrailingSlash($url);
    }

    private function cleanTrailingSlash($value): string {
        return rtrim($value, '/');
    }

    private function getSettingString($settingName): string
    {
        // Todo maybe pass a default value?
        return trim((string) $this->moduleSettingService->getString($settingName, Module::MODULE_ID));
    }

}
