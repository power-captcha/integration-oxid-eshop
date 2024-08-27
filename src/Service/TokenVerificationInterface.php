<?php

declare(strict_types=1);

namespace PowerCaptcha\OxidEshop\Service;

interface TokenVerificationInterface
{
    public function verifyToken(string|null $section, string $userFieldName = null, string $token = null): bool;
}