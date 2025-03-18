[{$smarty.block.parent}]

[{assign var="powerCaptcha" value=$oViewConf->getPowerCaptchaSettings()}]

<script>
    const powerCaptchaValidationMessage = "[{oxmultilang ident="POWER_CAPTCHA_CONFIRM_SECURITY_CHECK_HINT"}]";
</script>

[{if $powerCaptcha->isConfigured() && $powerCaptcha->isProtectionEnabled('LOGIN') }]
    
    [{if $powerCaptcha->isThemeActive('azure')}]

        [{capture assign="loginAccountPowerCaptchaJS"}]
            [{* Inserts POWER CAPTCHA to form/login_account.tpl when Azure Theme is active *}]
            (function () {
                const loginForm = document.querySelector(".accountLoginView form[name='login']");
                if(!loginForm) {
                    return; //form not found
                }

                const emailField = loginForm.querySelector("input[name='lgn_usr']");
                const submitButton = loginForm.querySelector("button[type='submit']");

                const captchaContainer = document.createElement('li');
                captchaContainer.innerHTML = `
                    [{include file='poca_widget.tpl' powerCaptchaSection='LOGIN' pcUserInputField="input[name='lgn_usr']"}]
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
            [{* Inserts POWER CAPTCHA to form/login_account.tpl when Flow Theme is active *}]
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
                        [{include file='poca_widget.tpl' powerCaptchaSection='LOGIN' pcUserInputField="input[name='lgn_usr']" pcCssClass=""}]
                        <div class="help-block pc-invalid-message"></div>
                    </div>
                `;

                captchaContainer.classList.add('form-group');

                captchaTarget.parentNode.insertBefore(captchaContainer, captchaTarget);
            })();
        [{/capture}]

        [{oxscript add=$loginAccountPowerCaptchaJS priority=10}]

    [{elseif $powerCaptcha->isThemeActive('wave')}]
        WAVE THEME
    [{else}]
        UNKOWN THEME: [{$oTheme->getActiveThemeId()}]
    [{/if}]

[{/if}]

[{* --------------------------------------------------------------------------------- *}]

[{if $powerCaptcha->isConfigured() && $powerCaptcha->isProtectionEnabled('FORGOTPWD') }]

    [{if $powerCaptcha->isThemeActive('azure')}]

        [{capture assign="forgotPwdPowerCaptchaJS"}]
            [{* Inserts POWER CAPTCHA to form/forgotpwd_email.tpl *}]
            (function () {
                document.querySelectorAll("form[name='forgotpwd']").forEach((forgtPwdForm) => {
                    const emailField = forgtPwdForm.querySelector("input[name='lgn_usr']");
                    const submitButton = forgtPwdForm.querySelector("button[type='submit']");

                    const captchaContainer = document.createElement('li');
                    captchaContainer.innerHTML = `
                        [{include file='poca_widget.tpl' powerCaptchaSection='FORGOTPWD' pcUserInputField="input[name='lgn_usr']"}]
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

    [{elseif $powerCaptcha->isThemeActive('flow')}]
        FLOW THEME
    [{elseif $powerCaptcha->isThemeActive('wave')}]
        WAVE THEME
    [{else}]
        UNKOWN THEME: [{$oTheme->getActiveThemeId()}]
    [{/if}]

[{/if}]

[{* --------------------------------------------------------------------------------- *}]

[{if $powerCaptcha->isConfigured() && $powerCaptcha->isProtectionEnabled('NEWSLETTER') }]

    [{if $powerCaptcha->isThemeActive('azure')}]

        [{capture assign="newsletterPowerCaptchaJS"}]
            [{* Inserts POWER CAPTCHA to form/newsletter.tpl on Azure Theme *}]
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
                            [{include file='poca_widget.tpl' powerCaptchaSection='NEWSLETTER' pcUserInputField="input[name='editval[oxuser__oxusername]']"}]
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

    [{/if}]

[{/if}]

[{*
[{capture assign="registerCaptchaJS"}]
    (function () {

        // Find the login form
        const registerForms = document.querySelectorAll("form[name='order']");

        registerForms.forEach((registerForm) => {
            const emailField = registerForm.querySelector("input[name='lgn_usr']");

            if(!registerForm || !emailField) {
                return; //form not found
            }
    
            // Set email field to required
            emailField.required = true;
    
            // Locate the submit button
            const submitButton = registerForm.querySelector("button[type='submit']");
            
            // Create container for the captcha widget
            const captchaContainer = document.createElement('div');
            captchaContainer.style.marginBottom = '15px';
            captchaContainer.innerHTML = `
                [{include file='poca_widget_base.tpl' powerCaptchaSection='REGISTER' pcUserInputField="input[name='lgn_usr']"}]
            `;
    
            // Insert container with widget before the submit button
            submitButton.parentNode.insertBefore(captchaContainer, submitButton);
        });
    })();
[{/capture}]
 *}]
