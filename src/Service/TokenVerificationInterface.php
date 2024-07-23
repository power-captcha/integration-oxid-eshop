<?php

declare(strict_types=1);

namespace PowerCaptcha\OxidEshop\Service;

interface TokenVerificationInterface
{
    public function verifyToken($userFieldName = null): bool;
}