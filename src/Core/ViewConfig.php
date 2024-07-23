<?php
namespace PowerCaptcha\OxidEshop\Core;

use PowerCaptcha\OxidEshop\Service\ModuleSettingsInterface;

/**
 * @eshopExtension
 * @mixin \OxidEsales\Eshop\Core\ViewConfig
 */
class ViewConfig extends ViewConfig_parent
{
    public function getPowerCaptchaSettings(): ModuleSettingsInterface
    {
        return $this->getService(ModuleSettingsInterface::class);
    }
}
