[{$smarty.block.parent}]

[{assign var="powerCaptcha" value=$oViewConf->getPowerCaptchaSettings()}]

[{if $powerCaptcha->isConfigured() && $powerCaptcha->isProtectionEnabled('FORGOTPWD') }]

    [{if $powerCaptcha->isThemeActive('azure')}]
        [{* Azure Theme uses javascript to include captcha (base_js.tpl) *}]
    [{elseif $powerCaptcha->isThemeActive('flow')}]

        <div class="form-group [{if $Errors.powerCaptchaErrors}]oxInValid[{/if}]">
            <div class="col-md-9 col-md-offset-3">
                [{include file='poca_widget.tpl' powerCaptchaSection='FORGOTPWD' pcUserInputField="input[name='lgn_usr']"}]
                <div class="help-block pc-invalid-message"></div>
            </div>
        </div>

    [{elseif $powerCaptcha->isThemeActive('wave')}]

        <div class="form-group [{if $Errors.powerCaptchaErrors}]oxInValid[{/if}]">
            [{include file='poca_widget.tpl' powerCaptchaSection='FORGOTPWD' pcUserInputField="input[name='lgn_usr']"}]
            <div class="help-block pc-invalid-message"></div>
        </div>

    [{else}]
        UNKOWN THEME: [{$oTheme->getActiveThemeId()}]
    [{/if}]

[{/if}]