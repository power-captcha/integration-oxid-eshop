<?php
namespace PowerCaptcha\OxidEshop\Component;

use PowerCaptcha\OxidEshop\Service\TokenVerificationInterface;

/**
 * @eshopExtension
 * @mixin \OxidEsales\Eshop\Application\Component\UserComponent
 */
class UserComponent extends UserComponent_parent
{

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

    public function createUser()
    {
        $tokenVerification = $this->getService(TokenVerificationInterface::class);
        
        if(false === $tokenVerification->verifyToken('lgn_usr')) {
            // Token not verified
            return false;
        }

        // Token verified
        return parent::createUser();
    }

}
