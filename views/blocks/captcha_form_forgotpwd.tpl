[{assign var="powerCaptcha" value=$oViewConf->getPowerCaptchaSettings()}]

[{if $powerCaptcha->isDisplayCaptcha('FORGOTPWD') }]

    [{* Integrates POWER CAPTCHA to Forgot Password Form (form/forgotpwd_email.tpl) *}]

    [{if $powerCaptcha->isThemeActive('azure')}]

        [{$smarty.block.parent}]
        [{* Azure Theme uses javascript (base_js.tpl) to integrate the captcha into form/forgotpwd_email.tpl. *}]
        [{* This is because Azure does not have a captcha_form block in form/forgotpwd_email.tpl *}]

    [{elseif $powerCaptcha->isThemeActive('flow')}]

        [{$smarty.block.parent}]
        <div class="form-group [{if $Errors.powerCaptchaErrors}]oxInValid[{/if}]">
            <div class="col-md-9 col-md-offset-3">
                [{include file='poca_widget.tpl' pcUserInputField="input[name='lgn_usr']"}]
                <div class="help-block pc-invalid-message"></div>
            </div>
        </div>

    [{elseif $powerCaptcha->isThemeActive('wave')}]

        [{$smarty.block.parent}]
        <div class="form-group [{if $Errors.powerCaptchaErrors}]oxInValid[{/if}]">
            [{include file='poca_widget.tpl' pcUserInputField="input[name='lgn_usr']"}]
            <div class="help-block pc-invalid-message"></div>
        </div>

        [{else}]
        
            [{$smarty.block.parent}]
            [{include file='poca_widget.tpl' pcUserInputField="input[name='lgn_usr']"}]
    
    [{/if}]

[{else}]

    [{$smarty.block.parent}]

[{/if}]