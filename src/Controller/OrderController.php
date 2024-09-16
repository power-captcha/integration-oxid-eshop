<?php
namespace PowerCaptcha\OxidEshop\Controller;

use PowerCaptcha\OxidEshop\Service\TokenVerificationInterface;

/**
 * @eshopExtension
 * @mixin \OxidEsales\Eshop\Application\Controller\OrderController
 */
class OrderController extends OrderController_parent
{
    public function execute()
    {
        $tokenVerification = $this->getService(TokenVerificationInterface::class);

        if(false === $tokenVerification->verifyToken('CHECKOUT')) {
             // Token not verified
            return;
        }

        // Token verified
        return parent::execute();
    }
}