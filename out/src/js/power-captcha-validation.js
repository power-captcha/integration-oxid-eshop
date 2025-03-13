document.addEventListener('PowerCaptchaReady', (e) => {
    const pc = e.detail.captcha;
    const form = pc.formElement;
    const invalidMessage = pc.widgetContainer.parentNode.querySelector('.pc-invalid-message');
    const userInputField = pc.getUserInputField();

    form.addEventListener('submit', (event) => {
        if(!pc.checkValidity()) {
            event.preventDefault();
            // scroll to invalid widget
            pc.widgetContainer.scrollIntoView({block: "center"});
        }
    });

    pc.addEventListener('statechange', (e) => {
        if(e.detail == 'invalid') {
            // scroll to invalid widget
            pc.widgetContainer.scrollIntoView({block: "center"});

            if(invalidMessage) {
                invalidMessage.innerHTML = `
                    <ul class="list-unstyled text-danger" role="alert"><li>${powerCaptchaValidationMessage}</li></ul>
                `;
            }
        } else if(e.detail == 'success') {
            if(invalidMessage) {
                invalidMessage.innerHTML = ``;
            }
        }
    });

    if(userInputField?.classList.contains('js-oxValidate')) {
        userInputField.required = true;
    }

    if(pc.widgetContainer.classList.contains('pc-show-invalid')) {
        pc.showInvalid(); // show invalid again after backend validation
        // scroll to invalid widget
        pc.widgetContainer.scrollIntoView({block: "center"});
    }
});