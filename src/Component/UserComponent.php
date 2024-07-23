<?php
namespace PowerCaptcha\OxidEshop\Component;

use PowerCaptcha\OxidEshop\Service\TokenVerificationInterface;

/**
 * @eshopExtension
 * @mixin \OxidEsales\Eshop\Application\Component\UserComponent
 */
class UserComponent extends UserComponent_parent
{
    // TODO Add integration for small login popup

    public function login() 
    {
        $tokenVerification = $this->getService(TokenVerificationInterface::class);

        if(false === $tokenVerification->verifyToken('lgn_usr')) {
            // Token not verified
            // Redirect to user login page
            return 'user';
        }

        // Token verified
        return parent::login();
    }

}
