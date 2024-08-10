document.addEventListener('DOMContentLoaded', function () {
    const switchButton = document.getElementById('editor-switch');
    const textareas = document.querySelectorAll('.textarea-widget');
    const ckeditors = document.querySelectorAll('.ckeditor-widget');

    switchButton.addEventListener('change', function () {
        if (switchButton.checked) {
            textareas.forEach(textarea => {
                textarea.style.display = 'none';
            });
            ckeditors.forEach(ckeditor => {
                ckeditor.style.display = 'block';
            });
        } else {
            textareas.forEach(textarea => {
                textarea.style.display = 'block';
            });
            ckeditors.forEach(ckeditor => {
                ckeditor.style.display = 'none';
            });
        }
    });

    // Initially hide textareas if switch is checked
    if (switchButton.checked) {
        textareas.forEach(textarea => {
            textarea.style.display = 'none';
        });
    } else {
        ckeditors.forEach(ckeditor => {
            ckeditor.style.display = 'none';
        });
    }
});
