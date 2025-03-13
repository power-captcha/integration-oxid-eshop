[{$smarty.block.parent}]

[{assign var="powerCaptcha" value=$oViewConf->getPowerCaptchaSettings()}]
[{assign var="oTheme" value="oxTheme"|@oxNew}]

[{if $powerCaptcha->isConfigured() && $powerCaptcha->isProtectionEnabled('REGISTER') }]

[{if $oTheme->getActiveThemeId() == "azure"}]

    </li>
    <li>
        [{include file='poca_widget.tpl' powerCaptchaSection='REGISTER' pcUserInputField="input[name='lgn_usr']" pcStyle="width: 260px;"}]

        <div class="pc-invalid-message [{if $Errors.powerCaptchaErrors}]oxInValid[{/if}]">
            <p class="oxValidateError" style="padding-left: 0px">
                <span style="display: block;">[{oxmultilang ident="POWER_CAPTCHA_CONFIRM_SECURITY_CHECK_HINT"}]</span>
            </p>
        </div>
    </li>

[{elseif $oTheme->getActiveThemeId() == "flow"}]

    <div class="form-group [{if $Errors.powerCaptchaErrors}]oxInValid[{/if}]">
        <div class="col-lg-9 col-lg-offset-3">
            [{include file='poca_widget.tpl' powerCaptchaSection='REGISTER' pcUserInputField="input[name='lgn_usr']"}]
            <div class="help-block pc-invalid-message"></div>
        </div>
    </div>

[{elseif $oTheme->getActiveThemeId() == "wave"}]

    <div class="form-group row [{if $Errors.powerCaptchaErrors}]oxInValid[{/if}]">
        <div class="col-lg-9 offset-lg-3">
            [{include file='poca_widget.tpl' powerCaptchaSection='REGISTER' pcUserInputField="input[name='lgn_usr']"}]
            <div class="help-block pc-invalid-message"></div>
        </div>
    </div>
    
[{else}]
    UNKOWN THEME: [{$oTheme->getActiveThemeId()}]
[{/if}]

[{/if}]