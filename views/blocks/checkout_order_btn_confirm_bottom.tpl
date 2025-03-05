[{$smarty.block.parent}]

[{assign var="powerCaptcha" value=$oViewConf->getPowerCaptchaSettings()}]
[{assign var="oTheme" value="oxTheme"|@oxNew}]

[{if $powerCaptcha->isConfigured() && $powerCaptcha->isProtectionEnabled('CHECKOUT') }]

[{if $oTheme->getActiveThemeId() == "azure"}]

    <div style="display: block; clear: both; float: right; padding-top: 10px;">

        [{include file='poca_widget.tpl' powerCaptchaSection='CHECKOUT' pcFormElement="#orderConfirmAgbBottom" pcStyle="width: 260px;"}]

        <div class="pc-invalid-message [{if $Errors.powerCaptchaErrors}]oxInValid[{/if}]">
            <p class="oxValidateError" style="padding-left: 0px">
                <span style="display: block;">[{oxmultilang ident="POWER_CAPTCHA_CONFIRM_SECURITY_CHECK_HINT"}]</span>
            </p>
        </div>

    </div>

[{elseif $oTheme->getActiveThemeId() == "flow"}]
    FLOW THEME
[{elseif $oTheme->getActiveThemeId() == "wave"}]
    WAVE THEME
[{else}]
    UNKOWN THEME: [{$oTheme->getActiveThemeId()}]
[{/if}]

[{/if}]