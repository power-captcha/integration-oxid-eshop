<?php

namespace PowerCaptcha\OxidEshop\Controller;

use OxidEsales\EshopCommunity\Internal\Container\ContainerFactory;
use PowerCaptcha\OxidEshop\Service\TokenVerificationInterface;

/**
 * @eshopExtension
 * @mixin \OxidEsales\Eshop\Application\Controller\ArticleDetailsController;
 */
class ArticleDetailsController extends ArticleDetailsController_parent
{
    public function addMe()
    {
        $container = ContainerFactory::getInstance()->getContainer();
        $tokenVerification = $container->get(TokenVerificationInterface::class);

        if (false === $tokenVerification->verifyToken('WISHEDPRICE', 'pa[email]')) {
             // Token not verified
            return;
        }

        // Token verified
        return parent::addMe();
    }
}
