

[{assign var="powerCaptcha" value=$oViewConf->getPowerCaptchaSettings()}]
[{assign var="oTheme" value="oxTheme"|@oxNew}]

[{if $powerCaptcha->isConfigured() && $powerCaptcha->isProtectionEnabled('CHECKOUT') }]

[{if $oTheme->getActiveThemeId() == "azure"}]
    [{* Azure Theme uses checkout_order_btn_confirm_bottom and checkout_order_btn_confirm_top blocks *}]
[{elseif $oTheme->getActiveThemeId() == "flow"}]

    <div class="pull-right">
        [{include file='poca_widget.tpl' powerCaptchaSection='CHECKOUT' pcCssClass=""}]
        <div class="help-block pc-invalid-message"></div>
    </div>
    <div class="clearfix"></div>

    [{$smarty.block.parent}]

[{elseif $oTheme->getActiveThemeId() == "wave"}]
    WAVE THEME
[{else}]
    UNKOWN THEME: [{$oTheme->getActiveThemeId()}]
[{/if}]

[{/if}]