[{assign var="powerCaptcha" value=$oViewConf->getPowerCaptchaSettings()}]

[{if $powerCaptcha->isDisplayCaptcha('NEWSLETTER') }]

    [{* Integrates POWER CAPTCHA to Newsletter Form (form/newsletter.tpl) *}]

    [{if $powerCaptcha->isThemeActive('azure')}]
        
        [{$smarty.block.parent}]
        [{* Azure Theme uses javascript (basea_js.tpl) to integrate the captcha into form/newsletter.tpl. *}]
        [{* This is because Azure does not have a captcha_form block in form/newsletter.tpl. *}]

    [{elseif $powerCaptcha->isThemeActive('flow')}]

        [{$smarty.block.parent}]
        <div class="form-group [{if $Errors.powerCaptchaErrors}]oxInValid[{/if}]">
            <div class="col-lg-offset-2 col-lg-5">
                [{include file='poca_widget.tpl' pcUserInputField="input[name='editval[oxuser__oxusername]']"}]
                <div class="help-block pc-invalid-message"></div>
            </div>
        </div>

    [{elseif $powerCaptcha->isThemeActive('wave')}]

        [{$smarty.block.parent}]
        <div class="form-group [{if $Errors.powerCaptchaErrors}]oxInValid[{/if}]">
            <div class="col-lg-5 offset-lg-2">
                [{include file='poca_widget.tpl' pcUserInputField="input[name='editval[oxuser__oxusername]"}]
                <div class="help-block pc-invalid-message"></div>
            </div>
        </div>

    [{else}]
        
        [{$smarty.block.parent}]
        [{include file='poca_widget.tpl' pcUserInputField="input[name='editval[oxuser__oxusername]"}]

    [{/if}]

[{else}]

    [{$smarty.block.parent}]

[{/if}]