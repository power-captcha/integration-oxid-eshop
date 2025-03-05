<?php
namespace PowerCaptcha\OxidEshop\Controller;

use OxidEsales\EshopCommunity\Internal\Container\ContainerFactory;
use PowerCaptcha\OxidEshop\Service\TokenVerificationInterface;

/**
 * @eshopExtension
 * @mixin \OxidEsales\Eshop\Application\Controller\OrderController
 */
class OrderController extends OrderController_parent
{
    public function execute()
    {
        $container = ContainerFactory::getInstance()->getContainer();
        $tokenVerification = $container->get(TokenVerificationInterface::class);

        if(false === $tokenVerification->verifyToken('CHECKOUT')) {
             // Token not verified
            return;
        }

        // Token verified
        return parent::execute();
    }
}