function enableEditMode() {
    richTextField.document.designMode = 'On';
}

function execCmd(command) {
    richTextField.document.execCommand(command, false, null);
}