<?php

namespace PowerCaptcha\OxidEshop\Controller;

use OxidEsales\EshopCommunity\Internal\Container\ContainerFactory;
use PowerCaptcha\OxidEshop\Service\TokenVerificationInterface;

/**
 * @eshopExtension
 * @mixin \OxidEsales\Eshop\Application\Controller\ContactController;
 */
class ContactController extends ContactController_parent
{
    public function send()
    {
        $container = ContainerFactory::getInstance()->getContainer();
        $tokenVerification = $container->get(TokenVerificationInterface::class);

        if (false === $tokenVerification->verifyToken('CONTACT', 'editval[oxuser__oxusername]')) {
             // Token not verified
            return false;
        }

        // Token verified
        return parent::send();
    }
}
