[{$smarty.block.parent}]

[{assign var="powerCaptcha" value=$oViewConf->getPowerCaptchaSettings()}]

[{if $powerCaptcha->isConfigured() && $powerCaptcha->isProtectionEnabled('LOGIN') }]

[{if $powerCaptcha->isThemeActive('azure')}]

    [{capture assign="loginCheckoutPowerCaptchaJS"}]
        (function () {

            // Find the checkout login form
            const loginForm = document.querySelector("#optionLogin");
            const emailField = loginForm.querySelector("input[name='lgn_usr']");

            if(!loginForm || !emailField) {
                return; //form not found
            }

            // Set email field to required
            emailField.required = true;
    
            // Locate the submitButton
            const submitButton = loginForm.querySelector("button[type='submit']");
            
            // Create container for the captcha widget
            const captchaContainer = document.createElement('li');
            captchaContainer.innerHTML = `
                [{include file='poca_widget.tpl' powerCaptchaSection='LOGIN' pcUserInputField="input[name='lgn_usr']" pcStyle="height: 56px;"}]
                <div class="pc-invalid-message [{if $Errors.powerCaptchaErrors}]oxInValid[{/if}]">
                    <p class="oxValidateError" style="padding-left: 0px">
                        <span style="display: inline;">[{oxmultilang ident="POWER_CAPTCHA_CONFIRM_SECURITY_CHECK_HINT"}]</span>
                    </p>
                </div>
            `;

            // Insert container with widget before the submit button
            submitButton.parentNode.parentNode.insertBefore(captchaContainer, submitButton.parentNode);

            document.addEventListener("PowerCaptchaReady", () => {
                // running oxEqualizer again, so that all checkout options are the equal height
                oxEqualizer.equalHeight($('.checkoutOptions .option'));
    
            });
        })();
    [{/capture}]

    [{oxscript add=$loginCheckoutPowerCaptchaJS priority=10}]


[{elseif $powerCaptcha->isThemeActive('flow')}]

    [{capture assign="loginCheckoutPowerCaptchaJS"}]
        [{* Inserts POWER CAPTCHA to form/login.tpl when Flow Theme is active *}]
        (function () {

            const loginForm = document.querySelector(".checkoutOptions form[name='login']");
            if(!loginForm) {
                return;
            }

            const emailField = loginForm.querySelector("input[name='lgn_usr']");
            const captchaTarget = loginForm.querySelector("#optionLogin .panel-body");
            
            // Create container for the captcha widget
            const captchaContainer = document.createElement('div');
            captchaContainer.innerHTML = `
                <div class="[{if $Errors.powerCaptchaErrors}]oxInValid[{/if}]">
                    [{include file='poca_widget.tpl' powerCaptchaSection='LOGIN' pcUserInputField="input[name='lgn_usr']" pcCssClass=""}]
                    <div class="help-block pc-invalid-message"></div>
                </div>
            `;

            emailField.required = true;
            captchaContainer.classList.add('form-group');

            captchaTarget.append(captchaContainer);

        })();
    [{/capture}]

    [{oxscript add=$loginCheckoutPowerCaptchaJS priority=10}]
    
[{elseif $powerCaptcha->isThemeActive('wave')}]
    [{* Wave theme uses the block checkout_options_login_passwordfield to display the captcha on Login Form durig checkout *}]
[{else}]
    UNKOWN THEME: [{$oTheme->getActiveThemeId()}]
[{/if}]

[{/if}]
