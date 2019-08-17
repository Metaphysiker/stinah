import tinymce from 'tinymce/tinymce';
import 'tinymce/themes/modern/theme';
import $ from 'jquery'

function tinyMce() {
    $(document).on('turbolinks:load', function () {
        tinyMCE.remove();
        tinyMCE.init({
            selector: 'textarea.tinymce',
            plugins: [
                'table', 'lists'
            ],
        });
    });
}

export { tinyMce };
