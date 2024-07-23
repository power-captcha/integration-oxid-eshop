<?php
namespace PowerCaptcha\OxidEshop\Controller;

use PowerCaptcha\OxidEshop\Service\TokenVerificationInterface;

// use OxidEsales\GdprOptinModule\Service\ModuleSettingsInterface;

/**
 * @eshopExtension
 * @mixin \OxidEsales\Eshop\Application\Controller\OrderController
 */
class OrderController extends OrderController_parent
{
    // TODO Add integration for checkout without registration

    public function execute()
    {
        $tokenVerification = $this->getService(TokenVerificationInterface::class);

        if(false === $tokenVerification->verifyToken()) {
             // Token not verified
            return;
        }

        return parent::execute();
    }
}