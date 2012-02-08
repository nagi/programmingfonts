# Core application logic and data
window.Progfonts =
  # Options / Public Data
  fonts: 'To be set before calling renderTo().'
  languages: 'To be set ...'
  selectedFont: 'To be set ...'
  destination: 'To be set ...'
  # External Functions
  selectedLanguage: ->
    storedLanguage = localStorage.getItem('selectedLanguage')
    storedLanguage ?= 'java'
  render: ->
    this.compileTemplate()
    this.higlightSyntax()
    this.useSelectedFont()
    this.highlightSelectedLanguage()
  # Internal functions & Private Data
  selectedFontData: ->
    this.fonts[this.selectedFont]
  selectedLanguageData: ->
    this.languages[this.selectedLanguage()]
  fontName: ->
    this.selectedFontData().name
  fontDescription: ->
    this.selectedFontData().description
  snippet: ->
    this.selectedLanguageData().snippet
  templateSource: """
                  <div id='code_snippet' class='{{selectedFont}}'>
                    <h1>{{fontName}}</h1>
                    <pre class='brush: {{selectedLanguage}}'>{{snippet}}</pre>
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
  $('.language_selector').click ->
    languageClicked = $(this).data().language
    localStorage.setItem('selectedLanguage', languageClicked)
    Progfonts.render()
    false
)
