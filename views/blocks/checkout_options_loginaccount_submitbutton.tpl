[{* Displays a CAPTCHA on the login page (form/login_account.tpl) for the Wave theme. 
    Note: This block is not included in the checkout login form, despite what the block name might suggest. *}]

[{assign var="powerCaptcha" value=$oViewConf->getPowerCaptchaSettings()}]
[{assign var="oTheme" value="oxTheme"|@oxNew}]

[{if $powerCaptcha->isConfigured() && $powerCaptcha->isProtectionEnabled('LOGIN') }]

    [{* Azure and Flow theme are using javascript (see blocks/base_js.tpl) to display the captcha in form/login_account.tpl *}]

    [{if $oTheme->getActiveThemeId() == "wave"}]

        <div class="form-group [{if $Errors.powerCaptchaErrors}]oxInValid[{/if}]">
            [{include file='poca_widget.tpl' powerCaptchaSection='LOGIN' pcUserInputField="input[name='lgn_usr']"}]
            <div class="help-block pc-invalid-message"></div>
        </div>

    [{else}]
        UNKOWN THEME: [{$oTheme->getActiveThemeId()}]
    [{/if}]

[{/if}]

[{$smarty.block.parent}]