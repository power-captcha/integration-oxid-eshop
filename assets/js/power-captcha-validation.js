document.addEventListener('PowerCaptchaReady', (e) => {
    const pc = e.detail.captcha;
    const form = pc.formElement;
    form.addEventListener('submit', (event) => {
        if(!pc.checkValidity()) {
            event.preventDefault();
        }
    });

    // Workaround for the Oxid Apex them custom validation
    pc.addEventListener('widgetClick', (event) => {
        // We need to reset the custom validation of the userInputField
        // otherwise, the field may remain invalid, preventing the checkAccess
        pc.getUserInputField().setCustomValidity('');
    });

    
    if(pc.widgetContainer.classList.contains('pc-show-invalid')) {
        pc.showInvalid(); // show invalid again after backend validation
    }
});