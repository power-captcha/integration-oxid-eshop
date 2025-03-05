[{$smarty.block.parent}]

[{assign var="powerCaptcha" value=$oViewConf->getPowerCaptchaSettings()}]
[{assign var="oTheme" value="oxTheme"|@oxNew}]

[{if $powerCaptcha->isConfigured() && $powerCaptcha->isProtectionEnabled('WISHEDPRICE') }]

    [{if $oTheme->getActiveThemeId() == "azure"}]

        <li>
            [{include file='poca_widget.tpl' powerCaptchaSection='WISHEDPRICE' pcUserInputField="input[name='pa[email]']"}]
            <div class="pc-invalid-message [{if $Errors.powerCaptchaErrors}]oxInValid[{/if}]">
                <p class="oxValidateError" style="padding-left: 0px">
                    <span style="display: block;">[{oxmultilang ident="POWER_CAPTCHA_CONFIRM_SECURITY_CHECK_HINT"}]</span>
                </p>
            </div>
        </li>

    [{elseif $oTheme->getActiveThemeId() == "flow"}]
        FLOW THEME
    [{elseif $oTheme->getActiveThemeId() == "wave"}]
        WAVE THEME
    [{else}]
        UNKOWN THEME: [{$oTheme->getActiveThemeId()}]
    [{/if}]

[{/if}]