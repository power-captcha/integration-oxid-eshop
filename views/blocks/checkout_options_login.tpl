[{$smarty.block.parent}]

[{assign var="powerCaptcha" value=$oViewConf->getPowerCaptchaSettings()}]
[{assign var="oTheme" value="oxTheme"|@oxNew}]

[{if $powerCaptcha->isConfigured() && $powerCaptcha->isProtectionEnabled('LOGIN') }]

[{if $oTheme->getActiveThemeId() == "azure"}]

    [{capture assign="loginCheckoutPowerCaptchaJS"}]
        (function () {

            // Find the checkout login form
            const loginForm = document.querySelector("#optionLogin");
            const emailField = loginBox.querySelector("input[name='lgn_usr']");

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


[{elseif $oTheme->getActiveThemeId() == "flow"}]
    FLOW THEME
[{elseif $oTheme->getActiveThemeId() == "wave"}]
    WAVE THEME
[{else}]
    UNKOWN THEME: [{$oTheme->getActiveThemeId()}]
[{/if}]

[{/if}]
