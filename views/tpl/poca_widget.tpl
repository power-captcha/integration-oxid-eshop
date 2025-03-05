[{assign var="powerCaptcha" value=$oViewConf->getPowerCaptchaSettings()}]

[{if $powerCaptcha->isConfigured() && $powerCaptcha->isProtectionEnabled($powerCaptchaSection) }]

    [{oxscript include=$powerCaptcha->getJavaScriptUrl()}]
    [{oxscript include=$oViewConf->getModuleUrl("power_captcha", "out/src/js/power-captcha-validation.js")}] 
    [{oxstyle include=$oViewConf->getModuleUrl("power_captcha", "out/src/css/power-captcha-oxid.css")}] 

    [{block name="power_captcha_widget"}]
        <div data-pc-api-key="[{$powerCaptcha->getApiKey()}]" 
            data-pc-client-uid="[{$powerCaptcha->getClientUid()}]"
            data-pc-endpoint="[{$powerCaptcha->getTokenRequestUrl()}]"
            data-pc-check-mode="[{$powerCaptcha->getCheckMode()}]"
            [{if isset($pcUserInputField)}]
            data-pc-user-input-field="[{$pcUserInputField}]"
            [{/if}]
            [{if isset($pcFormElement)}]
            data-pc-form-element="[{$pcFormElement}]"
            [{/if}]
            data-pc-debug="[{if $powerCaptcha->isDebugMode()}]true[{else}]false[{/if}]"
            class="[{$pcCssClass|default:""}] [{if $Errors.powerCaptchaErrors}]pc-show-invalid[{/if}]"
            style="[{$pcStyle|default:""}]">
        </div>
    [{/block}]

[{/if}]