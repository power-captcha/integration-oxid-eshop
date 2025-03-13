[{* Displays a CAPTCHA on login form durign checkout (form/login.tpl) for the Wave theme. *}]

[{$smarty.block.parent}]

[{assign var="powerCaptcha" value=$oViewConf->getPowerCaptchaSettings()}]
[{assign var="oTheme" value="oxTheme"|@oxNew}]

[{if $powerCaptcha->isConfigured() && $powerCaptcha->isProtectionEnabled('LOGIN') }]

    [{* Azure and Flow theme are using the block checkout_options_login (see blocks/checkout_options_login.tpl) to display the captcha in form/login.tpl *}]

    [{if $oTheme->getActiveThemeId() == "wave"}]

        <div class="form-group [{if $Errors.powerCaptchaErrors}]oxInValid[{/if}]">
            [{include file='poca_widget.tpl' powerCaptchaSection='LOGIN' pcUserInputField="input[name='lgn_usr']"}]
            <div class="help-block pc-invalid-message"></div>
        </div>

    [{else}]
        UNKOWN THEME: [{$oTheme->getActiveThemeId()}]
    [{/if}]

[{/if}]
    
