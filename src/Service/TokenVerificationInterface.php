<?php

declare(strict_types=1);

namespace PowerCaptcha\OxidEshop\Service;

interface TokenVerificationInterface
{
    public function verifyToken(string $userFieldName = null, string $token = null): bool;
}