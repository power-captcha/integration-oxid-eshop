[{assign var="powerCaptcha" value=$oViewConf->getPowerCaptchaSettings()}]

[{if $powerCaptcha->isDisplayCaptcha('CONTACT')}]

    [{* Integrates POWER CAPTCHA to Contact Form (form/contact.tpl) *}]

    [{if $powerCaptcha->isThemeActive('azure')}]

        [{$smarty.block.parent}]
        <li>
            [{include file='poca_widget.tpl' pcUserInputField="input[name='editval[oxuser__oxusername]']"}]
            <div class="pc-invalid-message [{if $Errors.powerCaptchaErrors}]oxInValid[{/if}]">
                <p class="oxValidateError" style="padding-left: 0px">
                    <span style="display: block;">[{oxmultilang ident="POWER_CAPTCHA_CONFIRM_SECURITY_CHECK_HINT"}]</span>
                </p>
            </div>
        </li>

    [{elseif $powerCaptcha->isThemeActive('flow')}]

        [{$smarty.block.parent}]
        <div class="form-group [{if $Errors.powerCaptchaErrors}]oxInValid[{/if}]">
            <div class="col-lg-offset-2 col-lg-10">
                [{include file='poca_widget.tpl' pcUserInputField="input[name='editval[oxuser__oxusername]']"}]
                <div class="help-block pc-invalid-message"></div>
            </div>
        </div>

    [{elseif $powerCaptcha->isThemeActive('wave')}]

        [{$smarty.block.parent}]
        <div class="form-group [{if $Errors.powerCaptchaErrors}]oxInValid[{/if}]">
            <div class="col-lg-10 offset-lg-2">
                [{include file='poca_widget.tpl' pcUserInputField="input[name='editval[oxuser__oxusername]"}]
                <div class="help-block pc-invalid-message"></div>
            </div>
        </div>

    [{else}]

        [{$smarty.block.parent}]
        [{include file='poca_widget.tpl' pcUserInputField="input[name='editval[oxuser__oxusername]"}]

    [{/if}]

[{else}]

    [{$smarty.block.parent}]
    
[{/if}]