<?php

namespace PowerCaptcha\OxidEshop\Controller;

use OxidEsales\EshopCommunity\Internal\Container\ContainerFactory;
use PowerCaptcha\OxidEshop\Service\TokenVerificationInterface;

/**
 * @eshopExtension
 * @mixin \OxidEsales\Eshop\Application\Controller\NewsletterController;
 */
class NewsletterController extends NewsletterController_parent
{
    public function send()
    {
        $container = ContainerFactory::getInstance()->getContainer();
        $tokenVerification = $container->get(TokenVerificationInterface::class);

        if (false === $tokenVerification->verifyToken('NEWSLETTER', 'editval[oxuser__oxusername]')) {
             // Token not verified
            return;
        }

        // Token verified
        return parent::send();
    }
}
