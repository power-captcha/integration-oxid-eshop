[{assign var="powerCaptcha" value=$oViewConf->getPowerCaptchaSettings()}]

[{if $powerCaptcha->isDisplayCaptcha('LOGIN') }]

    [{* Integrates POWER CAPTCHA to Login Form during Checkout (form/login.tpl ) *}

    [{if $powerCaptcha->isThemeActive('azure')}]

        [{capture assign="loginCheckoutPowerCaptchaJS"}]
            (function () {

                const loginForm = document.querySelector("#optionLogin");
                
                if(!loginForm) {
                    return; //form not found
                }
                    
                const emailField = loginForm.querySelector("input[name='lgn_usr']");
                const submitButton = loginForm.querySelector("button[type='submit']");

                const captchaContainer = document.createElement('li');
                captchaContainer.innerHTML = `
                    [{include file='poca_widget.tpl' pcUserInputField="input[name='lgn_usr']" pcStyle="height: 56px;"}]
                    <div class="pc-invalid-message [{if $Errors.powerCaptchaErrors}]oxInValid[{/if}]">
                        <p class="oxValidateError" style="padding-left: 0px">
                            <span style="display: inline;">[{oxmultilang ident="POWER_CAPTCHA_CONFIRM_SECURITY_CHECK_HINT"}]</span>
                        </p>
                    </div>
                `;
                
                emailField.required = true;

                submitButton.parentNode.parentNode.insertBefore(captchaContainer, submitButton.parentNode);
                
                document.addEventListener("PowerCaptchaReady", () => {
                    // running oxEqualizer again, so that all checkout options are the equal height
                    oxEqualizer.equalHeight($('.checkoutOptions .option'));
        
                });
            })();
        [{/capture}]

        [{$smarty.block.parent}]
        [{oxscript add=$loginCheckoutPowerCaptchaJS priority=10}]

    [{elseif $powerCaptcha->isThemeActive('flow')}]

        [{capture assign="loginCheckoutPowerCaptchaJS"}]
            (function () {

                const loginForm = document.querySelector(".checkoutOptions form[name='login']");
                if(!loginForm) {
                    return;
                }

                const emailField = loginForm.querySelector("input[name='lgn_usr']");
                const captchaTarget = loginForm.querySelector("#optionLogin .panel-body");

                const captchaContainer = document.createElement('div');
                captchaContainer.innerHTML = `
                    <div class="[{if $Errors.powerCaptchaErrors}]oxInValid[{/if}]">
                        [{include file='poca_widget.tpl' pcUserInputField="input[name='lgn_usr']" pcCssClass=""}]
                        <div class="help-block pc-invalid-message"></div>
                    </div>
                `;

                emailField.required = true;
                captchaContainer.classList.add('form-group');

                captchaTarget.append(captchaContainer);

            })();
        [{/capture}]

        [{$smarty.block.parent}]
        [{oxscript add=$loginCheckoutPowerCaptchaJS priority=10}]

    [{else}]
    
        [{$smarty.block.parent}]

        [{* The Wave theme instead uses the checkout_options_login_passwordfield block to integrate the captcha into form/login.tpl. *}]
        [{* Other themes also need to implement the checkout_options_login_passwordfield block in form/login.tpl, similar to the Wave theme. *}]
        
    [{/if}]

[{else}]

    [{$smarty.block.parent}]

[{/if}]