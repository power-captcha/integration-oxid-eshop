<?php

declare(strict_types=1);

namespace PowerCaptcha\OxidEshop\Service;

interface ModuleSettingsInterface
{
    public function isConfigured(): bool;

    public function getApiKey(): string;

    public function getSecretKey(): string;

    public function getCheckMode(): string;

    public function isDebugMode(): bool;

    public function getClientUid(): string;

    public function getTokenRequestUrl(): string;

    public function getTokenVerificationUrl(): string;

    public function getJavaScriptUrl(): string;
}
