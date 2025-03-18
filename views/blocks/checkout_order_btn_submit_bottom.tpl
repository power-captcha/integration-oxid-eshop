

[{assign var="powerCaptcha" value=$oViewConf->getPowerCaptchaSettings()}]

[{if $powerCaptcha->isConfigured() && $powerCaptcha->isProtectionEnabled('CHECKOUT') }]

[{if $powerCaptcha->isThemeActive('azure')}]
    [{* Azure Theme uses checkout_order_btn_confirm_bottom and checkout_order_btn_confirm_top blocks *}]
[{elseif $powerCaptcha->isThemeActive('flow')}]

    <div class="pull-right">
        [{include file='poca_widget.tpl' powerCaptchaSection='CHECKOUT' pcCssClass=""}]
        <div class="help-block pc-invalid-message"></div>
    </div>
    <div class="clearfix"></div>

    [{$smarty.block.parent}]

[{elseif $powerCaptcha->isThemeActive('wave')}]

    <div class="float-right">
        [{include file='poca_widget.tpl' powerCaptchaSection='CHECKOUT' pcCssClass="mb-3"}]
        <div class="help-block pc-invalid-message"></div>
    </div>
    <div class="clearfix"></div>

    [{$smarty.block.parent}]
    
[{else}]
    UNKOWN THEME: [{$oTheme->getActiveThemeId()}]
[{/if}]

[{/if}]