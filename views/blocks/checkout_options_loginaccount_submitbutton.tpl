[{assign var="powerCaptcha" value=$oViewConf->getPowerCaptchaSettings()}]

[{if $powerCaptcha->isDisplayCaptcha('LOGIN') }]

    [{* Integrates POWER CAPTCHA to Login Account Form (form/login_account.tpl) *}]
    [{* Note: This block is not included in the checkout login form, despite what the block name might suggest. *}]

    [{* Azure and Flow theme are using javascript (see blocks/base_js.tpl) to integrate the captcha into form/login_account.tpl *}]
    [{* This is because Azure and Flow do not contain a checkout_options_loginaccount_submitbutton block *}]

    [{if $powerCaptcha->isThemeActive('wave')}]

        <div class="form-group [{if $Errors.powerCaptchaErrors}]oxInValid[{/if}]">
            [{include file='poca_widget.tpl' pcUserInputField="input[name='lgn_usr']"}]
            <div class="help-block pc-invalid-message"></div>
        </div>
        [{$smarty.block.parent}]

    [{else}]

        [{include file='poca_widget.tpl' pcUserInputField="input[name='lgn_usr']"}]
        [{$smarty.block.parent}]

    [{/if}]

[{else}]

    [{$smarty.block.parent}]

[{/if}]