<?php
namespace PowerCaptcha\OxidEshop\Controller;

use PowerCaptcha\OxidEshop\Service\TokenVerificationInterface;

/**
 * @eshopExtension
 * @mixin \OxidEsales\Eshop\Application\Controller\ContactController;
 */
class ContactController extends ContactController_parent
{
 
    public function send()
    {
        $tokenVerification = $this->getService(TokenVerificationInterface::class);

        if(false === $tokenVerification->verifyToken('editval[oxuser__oxusername]')) {
             // Token not verified
            return false;
        }

        // Token verified
        return parent::send();
    }

}
