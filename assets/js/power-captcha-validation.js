document.addEventListener('PowerCaptchaReady', (e) => {
    const pc = e.detail.captcha;
    const form = pc.formElement;
    form.addEventListener('submit', (event) => {
        if(!pc.checkValidity()) {
            event.preventDefault();
        }
    });

    
    if(pc.widgetContainer.classList.contains('pc-show-invalid')) {
        pc.showInvalid(); // show invalid again after backend validation
    }
});