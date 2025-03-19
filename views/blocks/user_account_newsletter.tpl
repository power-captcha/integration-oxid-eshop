[{assign var="powerCaptcha" value=$oViewConf->getPowerCaptchaSettings()}]

[{if $powerCaptcha->isDisplayCaptcha('REGISTER') }]

    [{* Integrates POWER CAPTCHA to Register Form (form/fieldset/user_account.tpl) *}]

    [{if $powerCaptcha->isThemeActive('azure')}]

            [{$smarty.block.parent}]
        </li>
        <li>
            [{include file='poca_widget.tpl' pcUserInputField="input[name='lgn_usr']" pcStyle="width: 260px;"}]

            <div class="pc-invalid-message [{if $Errors.powerCaptchaErrors}]oxInValid[{/if}]">
                <p class="oxValidateError" style="padding-left: 0px">
                    <span style="display: block;">[{oxmultilang ident="POWER_CAPTCHA_CONFIRM_SECURITY_CHECK_HINT"}]</span>
                </p>
            </div>
        </li>

    [{elseif $powerCaptcha->isThemeActive('flow')}]

        [{$smarty.block.parent}]
        <div class="form-group [{if $Errors.powerCaptchaErrors}]oxInValid[{/if}]">
            <div class="col-lg-9 col-lg-offset-3">
                [{include file='poca_widget.tpl' pcUserInputField="input[name='lgn_usr']"}]
                <div class="help-block pc-invalid-message"></div>
            </div>
        </div>

    [{elseif $powerCaptcha->isThemeActive('wave')}]

        [{$smarty.block.parent}]
        <div class="form-group row [{if $Errors.powerCaptchaErrors}]oxInValid[{/if}]">
            <div class="col-lg-9 offset-lg-3">
                [{include file='poca_widget.tpl' pcUserInputField="input[name='lgn_usr']"}]
                <div class="help-block pc-invalid-message"></div>
            </div>
        </div>
        
    [{else}]

        [{$smarty.block.parent}]
        [{include file='poca_widget.tpl' powerCaptchaSection='REGISTER' pcUserInputField="input[name='lgn_usr']"}]

    [{/if}]

[{else}]

    [{$smarty.block.parent}]

[{/if}]