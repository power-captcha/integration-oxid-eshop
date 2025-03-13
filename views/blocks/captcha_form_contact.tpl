[{$smarty.block.parent}]

[{assign var="powerCaptcha" value=$oViewConf->getPowerCaptchaSettings()}]
[{assign var="oTheme" value="oxTheme"|@oxNew}]

[{if $powerCaptcha->isConfigured() && $powerCaptcha->isProtectionEnabled('CONTACT') }]

    [{if $oTheme->getActiveThemeId() == "azure"}]

        <li>
            [{include file='poca_widget.tpl' powerCaptchaSection='CONTACT' pcUserInputField="input[name='editval[oxuser__oxusername]']"}]
            <div class="pc-invalid-message [{if $Errors.powerCaptchaErrors}]oxInValid[{/if}]">
                <p class="oxValidateError" style="padding-left: 0px">
                    <span style="display: block;">[{oxmultilang ident="POWER_CAPTCHA_CONFIRM_SECURITY_CHECK_HINT"}]</span>
                </p>
            </div>
        </li>

    [{elseif $oTheme->getActiveThemeId() == "flow"}]

        <div class="form-group [{if $Errors.powerCaptchaErrors}]oxInValid[{/if}]">
            <div class="col-lg-offset-2 col-lg-10">
                [{include file='poca_widget.tpl' powerCaptchaSection='CONTACT' pcUserInputField="input[name='editval[oxuser__oxusername]']"}]
                <div class="help-block pc-invalid-message"></div>
            </div>
        </div>

    [{elseif $oTheme->getActiveThemeId() == "wave"}]

        <div class="form-group [{if $Errors.powerCaptchaErrors}]oxInValid[{/if}]">
            <div class="col-lg-10 offset-lg-2">
                [{include file='poca_widget.tpl' powerCaptchaSection='CONTACT' pcUserInputField="input[name='editval[oxuser__oxusername]"}]
                <div class="help-block pc-invalid-message"></div>
            </div>
        </div>

    [{else}]
        UNKOWN THEME: [{$oTheme->getActiveThemeId()}]
    [{/if}]

[{/if}]