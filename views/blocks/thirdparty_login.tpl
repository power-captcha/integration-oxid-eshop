[{$smarty.block.parent}]

[{assign var="powerCaptcha" value=$oViewConf->getPowerCaptchaSettings()}]

[{if $powerCaptcha->isConfigured() && $powerCaptcha->isProtectionEnabled('LOGIN') }]

[{if $powerCaptcha->isThemeActive('azure')}]

    [{capture assign="loginBoxPowerCaptchaJS"}]
        (function () {
            const loginBox = document.querySelector("#loginBox");
            if(!loginBox) {
                return; //form not found
            }

            const emailField = loginBox.querySelector("input[name='lgn_usr']");
            const submitButton = loginBox.querySelector("button[type='submit']");

            // Resize login box
            loginBox.querySelector('.loginForm').style.width = 'auto';
            // Set email field to required
            emailField.required = true;

            const captchaContainer = document.createElement('p');
            captchaContainer.innerHTML = `
                [{include file='poca_widget.tpl' powerCaptchaSection='LOGIN' pcUserInputField="input[name='lgn_usr']" pcStyle="width: 260px; text-transform: none; font-weight: normal;"}]
            `;

            submitButton.parentNode.insertBefore(captchaContainer, submitButton);

        })();
    [{/capture}]

    [{oxscript add=$loginBoxPowerCaptchaJS priority=10}]

[{elseif $powerCaptcha->isThemeActive('flow')}]

    [{capture assign="loginBoxPowerCaptchaJS"}]
        (function () {
            const loginBox = document.querySelector("#loginBox");
            if(!loginBox) {
                return; //form not found
            }

            const emailField = loginBox.querySelector("input[name='lgn_usr']");
            const submitButton = loginBox.querySelector("button[type='submit']");
            
            const captchaContainer = document.createElement('div');
            captchaContainer.innerHTML = `
            [{include file='poca_widget.tpl' powerCaptchaSection='LOGIN' pcUserInputField="input[name='lgn_usr']" 
                pcStyle="width: 260px; text-transform: none; font-weight: normal;"}]
                [{* TODO is pcStyle needed for flow theme? *}]
            `;
            
            captchaContainer.classList.add('form-group');
            emailField.required = true;

            submitButton.parentNode.insertBefore(captchaContainer, submitButton);

        })();
    [{/capture}]

    [{oxscript add=$loginBoxPowerCaptchaJS priority=10}]

[{elseif $powerCaptcha->isThemeActive('wave')}]

    [{capture assign="loginBoxPowerCaptchaJS"}]
        (function () {
            const loginBox = document.querySelector("#loginBox");
            if(!loginBox) {
                return; //form not found
            }

            const emailField = loginBox.querySelector("input[name='lgn_usr']");
            const submitButton = loginBox.querySelector("button[type='submit']");
            
            const captchaContainer = document.createElement('div');
            captchaContainer.innerHTML = `
                [{include file='poca_widget.tpl' powerCaptchaSection='LOGIN' pcUserInputField="input[name='lgn_usr']"}]
            `;
            
            captchaContainer.classList.add('form-group');
            emailField.required = true;

            submitButton.parentNode.insertBefore(captchaContainer, submitButton);

        })();
    [{/capture}]

    [{oxscript add=$loginBoxPowerCaptchaJS priority=10}]

[{else}]
    UNKOWN THEME: [{$oTheme->getActiveThemeId()}]
[{/if}]

[{/if}]
