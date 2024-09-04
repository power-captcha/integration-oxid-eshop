<?php
namespace PowerCaptcha\OxidEshop\Controller;

use PowerCaptcha\OxidEshop\Service\TokenVerificationInterface;

/**
 * @eshopExtension
 * @mixin \OxidEsales\Eshop\Application\Controller\PriceAlarmController;
 */
class PriceAlarmController extends PriceAlarmController_parent
{
 
    public function addme()
    {
        $tokenVerification = $this->getService(TokenVerificationInterface::class);

        if(false === $tokenVerification->verifyToken('WISHEDPRICE', 'pa[email]')) {
             // Token not verified
            return;
        }

        // Token verified
        return parent::addme();
    }

}
