[{assign var="powerCaptcha" value=$oViewConf->getPowerCaptchaSettings()}]

[{if $powerCaptcha->isDisplayCaptcha('CHECKOUT') }]

    [{* Integrates POWER CAPTCHA to Checkout Order Form (page/checkout/order.tpl) *}]

    [{if $powerCaptcha->isThemeActive('azure')}]

        [{$smarty.block.parent}]
        <div style="display: block; clear: both; float: right; margin-top: -25px;">
            [{include file='poca_widget.tpl' pcFormElement="#orderConfirmAgbTop" pcStyle="width: 260px;"}]
            <div class="pc-invalid-message [{if $Errors.powerCaptchaErrors}]oxInValid[{/if}]">
                <p class="oxValidateError" style="padding-left: 0px">
                    <span style="display: block;">[{oxmultilang ident="POWER_CAPTCHA_CONFIRM_SECURITY_CHECK_HINT"}]</span>
                </p>
            </div>
        </div>

    [{else}]

        [{$smarty.block.parent}]
        [{* The Flow and Wave themes instead use checkout_order_btn_submit_bottom to integrate the captcha into page/checkout/order.tpl. *}]
        [{* Other themes also need to implement the checkout_order_btn_submit_bottom block in page/checkout/order.tpl, similar to Flow and Wave. *}]
    
    [{/if}]

[{else}]

    [{$smarty.block.parent}]

[{/if}]