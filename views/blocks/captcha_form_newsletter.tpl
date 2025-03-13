[{$smarty.block.parent}]

[{assign var="powerCaptcha" value=$oViewConf->getPowerCaptchaSettings()}]
[{assign var="oTheme" value="oxTheme"|@oxNew}]

[{if $powerCaptcha->isConfigured() && $powerCaptcha->isProtectionEnabled('NEWSLETTER') }]

    [{if $oTheme->getActiveThemeId() == "azure"}]
        [{* Azure Theme uses javascript to include captcha (base_js.tpl) *}]
    [{elseif $oTheme->getActiveThemeId() == "flow"}]

        <div class="form-group [{if $Errors.powerCaptchaErrors}]oxInValid[{/if}]">
            <div class="col-lg-offset-2 col-lg-5">
                [{include file='poca_widget.tpl' powerCaptchaSection='NEWSLETTER' pcUserInputField="input[name='editval[oxuser__oxusername]']"}]
                <div class="help-block pc-invalid-message"></div>
            </div>
        </div>

    [{elseif $oTheme->getActiveThemeId() == "wave"}]

        <div class="form-group [{if $Errors.powerCaptchaErrors}]oxInValid[{/if}]">
            <div class="col-lg-5 offset-lg-2">
                [{include file='poca_widget.tpl' powerCaptchaSection='NEWSLETTER' pcUserInputField="input[name='editval[oxuser__oxusername]"}]
                <div class="help-block pc-invalid-message"></div>
            </div>
        </div>

    [{else}]
        UNKOWN THEME: [{$oTheme->getActiveThemeId()}]
    [{/if}]

[{/if}]