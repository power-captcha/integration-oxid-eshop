

[{assign var="powerCaptcha" value=$oViewConf->getPowerCaptchaSettings()}]

[{if $powerCaptcha->isDisplayCaptcha('CHECKOUT') }]

    [{* Integrates POWER CAPTCHA to Checkout Order Form (page/checkout/order.tpl) *}]

    [{if $powerCaptcha->isThemeActive('azure')}]
        
        [{$smarty.block.parent}]
        [{* Azure theme instead use the blocks checkout_order_btn_confirm_bottom and checkout_order_btn_confirm_top to integrate the captcha into page/checkout/order.tpl *}]
        [{* This is because Azure does not contain a checkout_order_btn_submit_bottom block *}]

    [{elseif $powerCaptcha->isThemeActive('flow')}]

        <div class="pull-right">
            [{include file='poca_widget.tpl' pcCssClass=""}]
            <div class="help-block pc-invalid-message"></div>
        </div>
        <div class="clearfix"></div>
        [{$smarty.block.parent}]

    [{elseif $powerCaptcha->isThemeActive('wave')}]

        <div class="float-right">
            [{include file='poca_widget.tpl' pcCssClass="mb-3"}]
            <div class="help-block pc-invalid-message"></div>
        </div>
        <div class="clearfix"></div>
        [{$smarty.block.parent}]
        
    [{else}]
        
        [{include file='poca_widget.tpl' pcCssClass=""}]
        [{$smarty.block.parent}]

    [{/if}]

[{else}]

    [{$smarty.block.parent}]

[{/if}]