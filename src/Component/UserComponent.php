<?php

namespace PowerCaptcha\OxidEshop\Component;

use OxidEsales\EshopCommunity\Internal\Container\ContainerFactory;
use PowerCaptcha\OxidEshop\Service\TokenVerificationInterface;

/**
 * @eshopExtension
 * @mixin \OxidEsales\Eshop\Application\Component\UserComponent
 */
class UserComponent extends UserComponent_parent
{
    public function login()
    {
        $container = ContainerFactory::getInstance()->getContainer();
        $tokenVerification = $container->get(TokenVerificationInterface::class);

        if (false === $tokenVerification->verifyToken('LOGIN', 'lgn_usr')) {
            // Token not verified
            // Redirect to user login page
            return 'user';
        }

        // Token verified
        return parent::login();
    }

    public function createUser()
    {
        $container = ContainerFactory::getInstance()->getContainer();
        $tokenVerification = $container->get(TokenVerificationInterface::class);

        if (false === $tokenVerification->verifyToken('REGISTER', 'lgn_usr')) {
            // Token not verified
            return false;
        }

        // Token verified
        return parent::createUser();
    }
}
