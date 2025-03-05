[{$smarty.block.parent}]

[{assign var="powerCaptcha" value=$oViewConf->getPowerCaptchaSettings()}]
[{assign var="oTheme" value="oxTheme"|@oxNew}]

[{if $powerCaptcha->isConfigured() && $powerCaptcha->isProtectionEnabled('LOGIN') }]

[{if $oTheme->getActiveThemeId() == "azure"}]

    [{capture assign="loginBoxPowerCaptchaJS"}]
        (function () {

            // Find the login box
            const loginBox = document.querySelector("#loginBox");
            const emailField = loginBox?.querySelector("input[name='lgn_usr']");

            if(!loginBox || !emailField) {
                return; //form not found
            }

            // Resize login box
            loginBox.querySelector('.loginForm').style.width = 'auto';

            // Set email field to required
            emailField.required = true;
    
            // Locate the submitButton
            const submitButton = loginBox.querySelector("button[type='submit']");
            
            // Create container for the captcha widget
            const captchaContainer = document.createElement('p');
            captchaContainer.innerHTML = `
                [{include file='poca_widget.tpl' powerCaptchaSection='LOGIN' pcUserInputField="input[name='lgn_usr']" pcStyle="width: 260px; text-transform: none; font-weight: normal;"}]
            `;
    
            // Insert container with widget before the submit button
            submitButton.parentNode.insertBefore(captchaContainer, submitButton);

        })();
    [{/capture}]

    [{oxscript add=$loginBoxPowerCaptchaJS priority=10}]


[{elseif $oTheme->getActiveThemeId() == "flow"}]
    FLOW THEME
[{elseif $oTheme->getActiveThemeId() == "wave"}]
    WAVE THEME
[{else}]
    UNKOWN THEME: [{$oTheme->getActiveThemeId()}]
[{/if}]

[{/if}]
