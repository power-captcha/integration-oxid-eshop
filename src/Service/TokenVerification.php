<?php

declare(strict_types=1);

namespace PowerCaptcha\OxidEshop\Service;

use OxidEsales\EshopCommunity\Core\Registry;
use Psr\Log\LoggerInterface;

/**
 * @extendable-class
 */
class TokenVerification implements TokenVerificationInterface
{
    public function __construct(
        private ModuleSettingsInterface $moduleSettings,
        private LoggerInterface $logger
    ) {
    }

    public function verifyToken($userFieldName = null): bool
    {
        if(false == $this->moduleSettings->isConfigured()) {
            $this->logger->warning('POWER CAPTCHA is not configured! Please provide API Key and Secret Key.');
            return true;
        }

        $token = Registry::getRequest()->getRequestParameter('pc-token', '');
        if(empty($token)) {
            $this->logger->warning('POWER CAPTCHA could not verify token, because it is empty.');
            $this->addErrorToDisplay();
            return false; // TODO add message
        }

        if($userFieldName) {
            $name = Registry::getRequest()->getRequestParameter($userFieldName, '');
        } else {
            $name = '';
        }

        // TODO try catch? exception handling

        // $logger = Registry::getLogger();

        $curl = curl_init($this->moduleSettings->getTokenVerificationUrl()); // TODO outsource to moduleSettings
        curl_setopt($curl, CURLOPT_RETURNTRANSFER, TRUE);
        curl_setopt($curl, CURLOPT_POST, TRUE);
    
        curl_setopt($curl, CURLOPT_HTTPHEADER, array(
            'X-API-Key: '.$this->moduleSettings->getApiKey(), // your api key
            'Content-Type: application/json'
        ));
    
        $requestParams = json_encode(array(
            'secret' => $this->moduleSettings->getSecretKey(), // your secret key
            'token' => $token,
            'clientUid' => $this->moduleSettings->getClientUid(), // unique client id (same value as in the data-client-uid attribute)
            'name' => $name // field which was marked by 'data-pc-user' (optional)
        ));

        curl_setopt($curl, CURLOPT_POSTFIELDS, $requestParams);

        $this->logger->debug('POWER CAPTCHA Token Verification request: '.$requestParams, [__CLASS__, __FUNCTION__]);
    
        $result = curl_exec($curl);
        curl_close($curl);

        $this->logger->debug('POWER CAPTCHA Token Verification Result: '.$result, [__CLASS__, __FUNCTION__]);

        $response = json_decode($result);

        if($response->success) {
            return true;
        }

        $this->addErrorToDisplay();
        return false; // TODO error message?
    }

    private function addErrorToDisplay() 
    {
        $exception = oxNew(\OxidEsales\Eshop\Core\Exception\StandardException::class, 'POWER_CAPTCHA_CONFIRM_SECURITY_CHECK_ERROR');
        // Display error without custom destination (will be showed in header)
        Registry::getUtilsView()->addErrorToDisplay(
            $exception,
            false,
            true
        );
        // Make the error available as Twig variable Errors.powerCaptchaErrors
        Registry::getUtilsView()->addErrorToDisplay(
            $exception,
            false,
            true,
            'powerCaptchaErrors'
        );
    }
}