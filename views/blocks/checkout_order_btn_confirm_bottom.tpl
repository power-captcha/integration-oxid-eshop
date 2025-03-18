[{$smarty.block.parent}]

[{assign var="powerCaptcha" value=$oViewConf->getPowerCaptchaSettings()}]

[{if $powerCaptcha->isConfigured() && $powerCaptcha->isProtectionEnabled('CHECKOUT') }]

[{if $powerCaptcha->isThemeActive('azure')}]

    <div style="display: block; clear: both; float: right; padding-top: 10px;">

        [{include file='poca_widget.tpl' powerCaptchaSection='CHECKOUT' pcFormElement="#orderConfirmAgbBottom" pcStyle="width: 260px;"}]

        <div class="pc-invalid-message [{if $Errors.powerCaptchaErrors}]oxInValid[{/if}]">
            <p class="oxValidateError" style="padding-left: 0px">
                <span style="display: block;">[{oxmultilang ident="POWER_CAPTCHA_CONFIRM_SECURITY_CHECK_HINT"}]</span>
            </p>
        </div>

    </div>

[{elseif $powerCaptcha->isThemeActive('flow')}]
    [{* Flow Theme uses checkout_order_btn_submit_bottom block *}]
[{elseif $powerCaptcha->isThemeActive('wave')}]
    WAVE THEME
[{else}]
    UNKOWN THEME: [{$oTheme->getActiveThemeId()}]
[{/if}]

[{/if}]