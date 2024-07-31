<?php

declare(strict_types=1);

namespace PowerCaptcha\OxidEshop\Service;

use OxidEsales\EshopCommunity\Core\Registry;
use Psr\Log\LoggerInterface;
use CurlHandle;
use PowerCaptcha\OxidEshop\Module;
use PowerCaptcha\OxidEshop\Exception\ApiError;
use PowerCaptcha\OxidEshop\Exception\UserError;

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

    public function verifyToken(string $userFieldName = null, string $token = null): bool
    {
        if(false ===$this->moduleSettings->isConfigured()) {
            $this->logger->error(
                'POWER CAPTCHA Token verification is skipped due to missing configuration! Please provide API Key and Secret Key.'
            );
            return true;
        }

        try {
            if(is_null($token)) {
                $token = Registry::getRequest()->getRequestParameter('pc-token', false);
                if(false === $token) {
                    throw new UserError('The user request does not contain a token field.');
                }
            }
            
            if(empty($token)) {
                throw new UserError('The user request contains an empty token.');
            }

            if(is_null($userFieldName)) {
                $name = '';
            } else {
                $name = Registry::getRequest()->getRequestParameter($userFieldName, '');
            }

            $requestBody = json_encode([
                'secret' => $this->moduleSettings->getSecretKey(),
                'token' => $token,
                'clientUid' => $this->moduleSettings->getClientUid(),
                'name' => $name
            ]);

            $this->logger->debug('POWER CAPTCHA Token verification API request: '.$requestBody);

            $curlHandle = $this->setupCurl($requestBody);

            $responseBody = curl_exec($curlHandle);
            $responseStatus = curl_getinfo($curlHandle, CURLINFO_HTTP_CODE);
            $curlError = curl_error($curlHandle);
            curl_close($curlHandle);

            $this->logger->debug('POWER CAPTCHA Token verifcation API result: '.var_export($responseBody, true).' / Status Code: '.$responseStatus);

            if($responseStatus === 200) {
                $response = json_decode($responseBody, true);
                if(isset($response['success']) && boolval($response['success'])) {
                    $this->logger->debug('POWER CAPTCHA Token successfully verified.');
                    return true;
                } else {
                    throw new UserError('Token was not solved by user or mismatch of clientUid or username.');
                }
            }
            
            if($responseStatus == 400) {
                $response = json_decode($responseBody, true);
                if(is_array($response['errors'])) {
                    if(in_array('MISSING_SECRET', $response['errors']) || in_array('INVALID_SECRET', $response['errors'])) {
                        throw new ApiError('Secret Key is invalid or missing in request. Please check your Secret Key!');
                    } else {
                        throw new UserError('User sent invalid or expired token.');
                    }
                }
                throw new ApiError('API returned Bad Request (400). Response: '.var_export($response, true));
            } 

            if(!empty($curlError)) {
                throw new ApiError('Error connecting to the API. Error: '.$curlError);
            } else {
                throw new ApiError('Unkown error connecting to the API. Status Code: '.$responseStatus.' / Request URL: '.$this->moduleSettings->getTokenVerificationUrl());
            }    
        } catch (UserError $e) {
            $this->logger->warning(
                'POWER CAPTCHA Token verification failed due to user input. Access is blocked. Reason: '.$e->getMessage()
            );
            $this->displayUserError();
            return false;
        } catch (ApiError $e) {
            if($this->moduleSettings->getApiErrorPolicy() == Module::API_ERROR_POLICY_BLOCK_ACCESS) {
                $this->logger->warning(
                    'POWER CAPTCHA Token verification failed due to an API error. Access is blocked based on API Error Policy. Error: '.$e->getMessage()
                );
                $this->displayApiError();
                return false;
            } else {
                $this->logger->error(
                    'POWER CAPTCHA Token verification failed due to an API error. Access nevertheless is granted based on API Error Policy. Error: '.$e->getMessage()
                );
                return true;
            }
        }
    }

    private function setupCurl(string $requestBody): CurlHandle {
        $curlHandle = curl_init($this->moduleSettings->getTokenVerificationUrl());
        curl_setopt($curlHandle, CURLOPT_RETURNTRANSFER, TRUE);
        curl_setopt($curlHandle, CURLOPT_POST, TRUE);
        curl_setopt($curlHandle, CURLOPT_HTTPHEADER, [
            'X-API-Key: '.$this->moduleSettings->getApiKey(),
            'Content-Type: application/json'
        ]);
        curl_setopt($curlHandle, CURLOPT_POSTFIELDS, $requestBody);

        return $curlHandle;
    }

    private function displayUserError() 
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

    private function displayApiError() 
    {
        $exception = oxNew(\OxidEsales\Eshop\Core\Exception\StandardException::class, 'POWER_CAPTCHA_SECURITY_CHECK_API_ERROR');
        // Display error without custom destination (will be showed in header)
        Registry::getUtilsView()->addErrorToDisplay(
            $exception,
            false,
            true
        );
    }
}