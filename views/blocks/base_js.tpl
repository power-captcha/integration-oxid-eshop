[{$smarty.block.parent}]

[{assign var="powerCaptcha" value=$oViewConf->getPowerCaptchaSettings()}]

<script>
    const powerCaptchaValidationMessage = "[{oxmultilang ident="POWER_CAPTCHA_CONFIRM_SECURITY_CHECK_HINT"}]";
</script>

[{if $powerCaptcha->isDisplayCaptcha('LOGIN') }]
    
    [{* Integrates POWER CAPTCHA to Login Account Form (form/login_account.tpl) *}]

    [{if $powerCaptcha->isThemeActive('azure')}]

        [{capture assign="loginAccountPowerCaptchaJS"}]
            (function () {
                const loginForm = document.querySelector(".accountLoginView form[name='login']");
                if(!loginForm) {
                    return; //form not found
                }

                const emailField = loginForm.querySelector("input[name='lgn_usr']");
                const submitButton = loginForm.querySelector("button[type='submit']");

                const captchaContainer = document.createElement('li');
                captchaContainer.innerHTML = `
                    [{include file='poca_widget.tpl' pcUserInputField="input[name='lgn_usr']"}]
                    <div class="pc-invalid-message [{if $Errors.powerCaptchaErrors}]oxInValid[{/if}]">
                        <p class="oxValidateError" style="padding-left: 0px">
                            <span style="display: inline;">${powerCaptchaValidationMessage}</span>
                        </p>
                    </div>
                `;

                submitButton.parentNode.parentNode.insertBefore(captchaContainer, submitButton.parentNode);
            })();
        [{/capture}]

        [{oxscript add=$loginAccountPowerCaptchaJS priority=10}]

    [{elseif $powerCaptcha->isThemeActive('flow')}]

        [{capture assign="loginAccountPowerCaptchaJS"}]
            (function () {
                const loginForm = document.querySelector(".panel form[name='login']");
                if(!loginForm) {
                    return; //form not found
                }

                const emailField = loginForm.querySelector("input[name='lgn_usr']");
                const captchaTarget = loginForm.querySelector("button[type='submit']").parentNode.parentNode;

                const captchaContainer = document.createElement('div');
                captchaContainer.innerHTML = `
                    <div class="col-lg-offset-2 col-lg-10 [{if $Errors.powerCaptchaErrors}]oxInValid[{/if}]">
                        [{include file='poca_widget.tpl' pcUserInputField="input[name='lgn_usr']" pcCssClass=""}]
                        <div class="help-block pc-invalid-message"></div>
                    </div>
                `;

                captchaContainer.classList.add('form-group');

                captchaTarget.parentNode.insertBefore(captchaContainer, captchaTarget);
            })();
        [{/capture}]

        [{oxscript add=$loginAccountPowerCaptchaJS priority=10}]

    [{else}]

        [{* The Wave theme instead uses the checkout_options_loginaccount_submitbutton block to integrate the captcha into form/login_account.tpl. *}]
        [{* Other themes also need to implement the checkout_options_loginaccount_submitbutton block in form/login_account.tpl, similar to the Wave theme. *}]
        
    [{/if}]

[{/if}]

[{* --------------------------------------------------------------------------------- *}]

[{if $powerCaptcha->isDisplayCaptcha('FORGOTPWD') }]

    [{* Integrates POWER CAPTCHA to Forgot Password Form (form/forgotpwd_email.tpl) *}]

    [{if $powerCaptcha->isThemeActive('azure')}]

        [{capture assign="forgotPwdPowerCaptchaJS"}]
            (function () {
                document.querySelectorAll("form[name='forgotpwd']").forEach((forgtPwdForm) => {
                    const emailField = forgtPwdForm.querySelector("input[name='lgn_usr']");
                    const submitButton = forgtPwdForm.querySelector("button[type='submit']");

                    const captchaContainer = document.createElement('li');
                    captchaContainer.innerHTML = `
                        [{include file='poca_widget.tpl' pcUserInputField="input[name='lgn_usr']"}]
                        <div class="pc-invalid-message [{if $Errors.powerCaptchaErrors}]oxInValid[{/if}]">
                            <p class="oxValidateError" style="padding-left: 0px">
                                <span style="display: inline;">${powerCaptchaValidationMessage}</span>
                            </p>
                        </div>
                    `;

                    submitButton.parentNode.parentNode.insertBefore(captchaContainer, submitButton.parentNode);
                });
            })();
        [{/capture}]

        [{oxscript add=$forgotPwdPowerCaptchaJS priority=10}]

    [{else}]
        [{* The Wave and Flow themes instead use the captcha_form block (see captcha_form_forgotpwd.tpl) to integrate the captcha into form/forgotpwd_email.tpl. *}]
        [{* Other themes also need to implement the captcha_form block in form/forgotpwd_email.tpl, similar to the Wave and Flow themes. *}]
    [{/if}]

[{/if}]

[{* --------------------------------------------------------------------------------- *}]

[{if $powerCaptcha->isDisplayCaptcha('NEWSLETTER') }]

    [{* Integrates POWER CAPTCHA to Newsletter Form (form/newsletter.tpl) *}]

    [{if $powerCaptcha->isThemeActive('azure')}]

        [{capture assign="newsletterPowerCaptchaJS"}]
            (function () {
                document.querySelectorAll("form").forEach((newsletterForm) => {
                        if(!newsletterForm.querySelector("input[name='cl'][value='newsletter']") 
                            || !newsletterForm.querySelector("input[name='fnc'][value='send']") ) {
                            return; // not the right form
                        }

                        const emailField = newsletterForm.querySelector("input[name='editval[oxuser__oxusername]");
                        const submitButton = newsletterForm.querySelector("button[type='submit']");

                        const captchaContainer = document.createElement('li');
                        captchaContainer.innerHTML = `
                            [{include file='poca_widget.tpl' pcUserInputField="input[name='editval[oxuser__oxusername]']"}]
                            <div class="pc-invalid-message [{if $Errors.powerCaptchaErrors}]oxInValid[{/if}]">
                                <p class="oxValidateError" style="padding-left: 0px">
                                    <span style="display: inline;">${powerCaptchaValidationMessage}</span>
                                </p>
                            </div>
                        `;

                        submitButton.parentNode.parentNode.insertBefore(captchaContainer, submitButton.parentNode);
                    });
            })();
        [{/capture}]

        [{oxscript add=$newsletterPowerCaptchaJS priority=10}]
    [{else}]
        [{* The Wave and Flow themes instead use the captcha_form block (see captcha_form_newsletter.tpl) to integrate the captcha into form/newsletter.tpl. *}]
        [{* Other themes also need to implement the captcha_form block in form/newsletter.tpl, similar to the Wave and Flow themes. *}]
    [{/if}]

[{/if}]