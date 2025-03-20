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

            // show validation message
            if(invalidMessage) {
                invalidMessage.classList.add('oxInValid');
                invalidMessage.classList.add('pc-show-message');
            }
        } else if(e.detail == 'success') {

            // hide validation message
            if(invalidMessage) {
                invalidMessage.classList.remove('oxInValid');
                invalidMessage.classList.remove('pc-show-message');
            }
        }
    });

    if(userInputField?.classList.contains('js-oxValidate')) {
        userInputField.required = true;
    }

    if(pc.widgetContainer.classList.contains('pc-show-invalid')) {
        // show invalid again after backend validation
        pc.widget.setVisible(true); 
        pc.showInvalid(); 
        
        // scroll to invalid widget
        pc.widgetContainer.scrollIntoView({block: "center"});
    }
});