<?php
namespace PowerCaptcha\OxidEshop\Controller;

use PowerCaptcha\OxidEshop\Service\TokenVerificationInterface;

/**
 * @eshopExtension
 * @mixin \OxidEsales\Eshop\Application\Controller\ForgotPasswordController;
 */
class ForgotPasswordController extends ForgotPasswordController_parent
{
 
    public function forgotPassword()
    {
        $tokenVerification = $this->getService(TokenVerificationInterface::class);

        if(false === $tokenVerification->verifyToken('FORGOTPWD', 'lgn_usr')) {
             // Token not verified
             $this->_sForgotEmail = false;
             return;
        }

        // Token verified
        return parent::forgotPassword();
    }

}
