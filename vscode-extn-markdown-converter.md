# Configuring MarkdownConverter
`Fri 2017-May-26 16:43:00.213 +05:30`

> https://github.com/manuth/MarkdownConverter/wiki/Config

```js
/*********************
 * MarkdownConverter-Config
 *********************/
{
    /*==============================
     * Specifying the output-directory
     *==============================
     *
     * The converted files are going to be placed into the same directory like the markdown-file.
     *
     * You can choose where to place the converted files by defining the Output-Directory-setting.
     * This can be relative to the folder of the markdown-file.
     *
     * Example:
     * "markdownConverter.outDir": "pdf"
     */
    "markdownConverter.outDir": ".",

    /*==============================
     * Specifying the working-directory
     *==============================
     *
     * This path can be relative to the folder currently opened by Visual Studio Code.
     * The working-directory of `MarkdownConverter`
     * Each filepath, such as stylesheets and templates,
     * can be relative to the working-directory-path.
     *
     * Example:
     * "markdownConverter.workDir": "./Resources"
     */
    "markdownConverter.workDir": ".",

    /*==============================
     * Specifying whether to ignore the language of the current file
     *==============================
     *
     * By default MarkdownConverter prevents you
     * from converting files which aren't written in Markdown.
     * However there may be several situations where you want to convert a file
     * which isn't written in Markdown such as a plain-text-file or an HTML-file.
     *
     * You can allow files which aren't written in Markdown by setting this to true.
     */
    "markdownConverter.ignoreLanguage": false,

    /*==============================
     * Specifying whether to save files automatically
     *==============================
     *
     * If the current file contains pending changes MarkdownConverter
     * will automatically save the file before converting it.
     *
     * Set this to false to prevent auto-saving the file.
     */
    "markdownConverter.autoSave": true,
    
    /*==============================
     * Specifying the output-quality
     *==============================
     *
     * You may want to specify the quality of your
     * resulting image-files (such as PNG or JPEG).
     * You can do this by setting this value.
     */
    "markdownConverter.document.quality": 90,

    /*==============================
     * Specifying the conversion-types
     *==============================
     *
     * You can set what types to convert the markdown-file to by setting this.
     * It can either be a single type or an array of types.
     *
     * Example:
     * "markdownConverter.conversionType": [
     *     "PDF",
     *     "HTML"
     * ]
     */
    "markdownConverter.conversionType": "PDF",

    /*==============================
     * This node contains settings related to the document
     *==============================
     */
    "markdownConverter.document": {
        /*--------------------
         * Specifying the name of the document
         *--------------------
         *
         * By default the resulting files are named just like the markdown-file.
         * You can set the name of the resulting files by defining the name-setting.
         * The propper extension for your output-type will
         * be added automatically during the conversion.
         *
         * Example:
         * "name": "Outputfile"
         */

        /*--------------------
         * Enabling/Disabling emojis
         *--------------------
         *
         * You can either enable or disable emojis or set what kind of emojis to use.
         * Set this option to true to enable the default (github-)emojis or
         * Set this option to false to disable emojis.
         *
         * Example:
         * "emoji": "twitter"
         */
        "emoji": "github",

        /*--------------------
         * Specifying the attributes of the document
         *--------------------
         *
         * Add specific attributes to the document.
         * Have a look at this page to learn more about attributes:
         * https://github.com/manuth/MarkdownConverter/wiki/Attributes
         *
         * Example:
         * "attributes": {
         *     "Author": "Mike Wazowski"
         *     "Tagline": "I'm watching you, Mike Wazowski... always... watching..."
         * }
         */
        
        /*==============================
         * This node contains localization-settings
         *==============================
         */
        "localization": {
            /*--------------------
             * Specifying the locale
             *--------------------
             *
             * MarkdownConverter's using Visual Studio Code's locale by default.
             * However you can overwrite it with whatever language you want.
             *
             * Example:
             * "locale": "en-US"
             */

            /*--------------------
             * Specifying the date-format
             *--------------------
             *
             * Sets the way to print date inside of your doc.
             * See https://msdn.microsoft.com/en-US/library/8kb3ddd4(v=vs.110).aspx
             *
             * Example:
             * "dateFormat": "MM/dd/yy H:mm:ss"
             */
            "dateFormat": "default"
        },

        /*==============================
         * This node contains layout-options
         *==============================
         *
         * You must either set margin, width and height of the paper
         * or margin, paper-format and the orientation of the paper.
         */
        "layout": {
            /*--------------------
             * Specifying the margin of the document
             *--------------------
             *
             * Valid units are:
             * 'mm', 'cm', 'in', 'px'. No unit means 'px'.
             */
            "margin": {
                "top": "1cm",
                "right": "1cm",
                "bottom": "1cm",
                "left": "1cm"
            },

            /*--------------------
             * Specifying the width of the document
             *--------------------
             *
             * Valid units are:
             * 'mm', 'cm', 'in', 'px'. No unit means 'px'.
             *
             * Example:
             * "width": "20cm"
             */

            /*--------------------
             * Specifying the height of the document
             *--------------------
             *
             * Valid units are:
             * 'mm', 'cm', 'in', 'px'. No unit means 'px'.
             *
             * Example:
             * "height": "30cm"
             */
            
            /*--------------------
             * Specifying the paper-format of the document
             *--------------------
             */
            "format": "A4",
        
            /*--------------------
             * Specifying the paper-orientation of the document
             *--------------------
             *
             * This can either be "portrait" or "landspace".
             */
            "orientation": "portrait"
        },

        /*--------------------
         * Specifying the header of the document
         *--------------------
         */
        "header": {
            /*--------------------
             * Specifying the height of the header
             *--------------------
             */
            "height": "15mm",

            /*--------------------
             * Specifying the content of the header
             *--------------------
             */
            "content": "<table style=\"width: 100%; table-layout: fixed; \"><td style=\"text-align: left; \">{{ Author }}</td><td style=\"text-align: center\">{{ PageNumber }}/{{ PageCount }}</td><td style=\"text-align: right\">{{ Company.Name }}</td></table>"
        },

        /*--------------------
         * Specifying special headers
         *--------------------
         *
         * Here you can define a set of headers
         * which are assigned to a specific page.
         *
         * Example:
         * "specialHeaders": [
         *      "pageNumber": 2,
         *      "header": {
         *          "height": "15mm",
         *          "content": "This is page number two"
         *      }
         *  ]
         */

        /*--------------------
         * Specifying the header for even or odd pages or the last page
         *--------------------
         *
         * You can even specify a header for even or odd pages or the last page like this:
         * "evenHeader": {
         *     "height": "15mm"
         *     "content": "This is an even page"
         * },
         * "oddHeader": {
         *     "height": "15mm",
         *     "content": "This is an odd page"
         * },
         * "lastHeader": {
         *      "height: "15mm",
         *      "content": "This is the last page"
         *  }
         */

        /*--------------------
         * Specifying the default footer
         *--------------------
         *
         * Footers are looking just the same way like headers.
         * So you can also specify "specialFooters", "evenFooter", "oddFooter" and "lastFooter".
         */
        "footer": {
            "height": "1cm",
            "content": "<table style=\"width: 100%; table-layout: fixed; \"><td style=\"text-align: left; \"></td><td style=\"text-align: center\">{{ CreationDate }}</td><td style=\"text-align: right\"></td></table>"
        },

        /*==============================
         * This node contains style-settings of the document
         *==============================
         */
        "style": {
            /*--------------------
             * Specifying the template
             *--------------------
             *
             * Learn more about templates here:
             * https://github.com/manuth/MarkdownConverter/wiki/Template
             *
             * Example:
             * "template": "Template.html"
             */

            /*--------------------
             * Specifying the wrapper
             *--------------------
             *
             * You may want to wrap your document with a specified tag or class, for example:
             *
             * "wrapper": "<div class=\"container\">{{ content }}</div>"
             */
            
            /*--------------------
             * Enabling/disabling or configuring the highlighting
             *--------------------
             *
             * You can choose one out of many highlighting-styles
             * or set it to true to use the default one.
             * Set this to false to disable highlighting.
             * "highlightStyle": "rainbow"
             */
            "highlightStyle": true,

            /*--------------------
             * Enabling or disabling system-provided styles
             *--------------------
             *
             * System-provided styles are turned on by default.
             * You may want to turn of system-styles in order
             * to write your own stylesheet completely from scratch.
             *
             * You can do this by setting this option to false.
             */
            "useSystemStyles": true,

            /*--------------------
             * Setting styles
             *--------------------
             *
             * You may wanna define some CSS-styles right in the json-file.
             * You can use this option for doing so:
             * "styles": "*\n{\n    color: red !important\n}"
             */
            
            /*--------------------
             * Style-sheets
             *--------------------
             *
             * You could also define a set of style-sheets to use.
             *
             * Example:
             * "styleSheets": [
             *     ".vscode/styles.css",
             *     "https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css"
             * ]
             */
        }
    }
}
```
