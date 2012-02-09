# Core application logic and data
window.Progfonts =
  # Options / Public Data
  fonts: null #To be set before calling renderTo().
  languages: null #To be set ...
  selectedFont: null #To be set ...
  destination: null #To be set ...
  # External Functions
  fontName: ->
    this.selectedFontData().name
  description: ->
    this.selectedFontData().description
  snippet: ->
    this.selectedLanguageData().snippet
  selectedLanguage: ->
    storedLanguage = localStorage.getItem('selectedLanguage')
    storedLanguage ?= 'java'
  render: ->
    this.compileTemplate() if Progfonts.destination?
    this.higlightSyntax()
    this.useSelectedFont()
    this.highlightSelectedLanguage()
  # Internal functions & Private Data
  selectedFontData: ->
    this.fonts[this.selectedFont]
  selectedLanguageData: ->
    this.languages[this.selectedLanguage()]
  fontDescription: ->
    this.selectedFontData().description
  templateSource: """
                  <div id='code_snippet' class='{{selectedFont}}'>
                    <h1>{{fontName}}</h1>
                    <p class='description'>
                    {{description}}<a href="/">Font list.</a>
                    </p>
                    <pre class='brush: {{selectedLanguage}}; gutter: false;'>{{snippet}}</pre>
                  </div>
                  """
  compileTemplate: ->
    template = Handlebars.compile(this.templateSource)
    rendered_html = template(this)
    $(this.destination).replaceWith(rendered_html)
  higlightSyntax: ->
    SyntaxHighlighter.highlight()
  useSelectedFont: ->
    $('code').addClass(this.selectedFont)
  highlightSelectedLanguage: ->
    $('.language_selector').removeClass('selected')
    $('[data-language=' + this.selectedLanguage() + ']').addClass('selected')

# Change language of code snippet without hitting the server
$(->
  Progfonts.highlightSelectedLanguage()
  $('.language_selector').click ->
    languageClicked = $(this).data().language
    localStorage.setItem('selectedLanguage', languageClicked)
    Progfonts.render()
    false
)
