[{assign var="powerCaptcha" value=$oViewConf->getPowerCaptchaSettings()}]

[{if $powerCaptcha->isDisplayCaptcha('LOGIN') }]

    [{* Integrates POWER CAPTCHA to Login Form during Checkout (form/login.tpl ) *}

    [{* The Azure and Flow themes instead use JavaScript in the checkout_options_login block to integrate the captcha into form/login.tpl. *}]
    [{* This is because Azure and Flow do not contain a checkout_options_login_passwordfield block in form/login.tpl. *}]
    
    [{if $powerCaptcha->isThemeActive('wave')}]
        [{* Displays a CAPTCHA on login form durign checkout (form/login.tpl) for the Wave theme. *}]

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