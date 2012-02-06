# Core application logic and data
window.Progfonts =
  # Options
  fonts: 'To be set before calling renderTo().'
  languages: 'To be set ...'
  selectedFont: 'To be set ...'
  selectedLanguage: 'To be set ...'
  destination: 'To be set ...'
  # External Functions
  render: ->
    this.compileTemplate()
    this.higlightSyntax()
    this.useSelectedFont()
  # Internal functions & Data
  selectedFontData: ->
    this.fonts[this.selectedFont]
  selectedLanguageData: ->
    this.languages[this.selectedLanguage]
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

# Change language of code snippet without hitting the server
$(->
  changeCodeSnippetTo = (language)->
    Progfonts.selectedLanguage = language
    Progfonts.render()

  $('.language_selector').click ->
    languageClicked = $(this).data().language
    changeCodeSnippetTo(languageClicked)
    false
)
