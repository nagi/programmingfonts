# Core application logic and data
window.Progfonts =
  # Options / Public Data
  fonts: null #To be set before calling renderTo().
  languages: null #To be set ...
  selectedFont: null #To be set ...
  destinationId: 'template_destination'
  # External Functions
  fontName: ->
    this.selectedFontData().name
  description: ->
    this.selectedFontData().description
  link: ->
    this.selectedFontData().link
  snippet: ->
    this.selectedLanguageData().snippet
  selectedLanguage: ->
    storedLanguage = localStorage.getItem('selectedLanguage')
    storedLanguage ?= 'java'
  selectedTheme: ->
    storedLanguage = localStorage.getItem('selectedTheme')
    storedLanguage ?= 'light'
  toggleTheme: ->
    $('body').toggleClass('light')
    $('body').toggleClass('dark')
  render: ->
    this.compileTemplate() if Progfonts.selectedFont?
    this.higlightSyntax()
    this.useSelectedFont()
    this.highlightSelectedLanguage()
  highlightSelectedLanguage: ->
    $('.language_selector').removeClass('selected')
    $('[data-language=' + this.selectedLanguage() + ']').addClass('selected')
  useSelectedTheme: ->
    unless $('body').hasClass(Progfonts.selectedTheme()) then Progfonts.toggleTheme()
    if Progfonts.selectedTheme() == 'dark' then $('.theme_switcher .bulbOn').hide()
  # Internal functions & Private Data
  selectedFontData: ->
    this.fonts[this.selectedFont]
  selectedLanguageData: ->
    this.languages[this.selectedLanguage()]
  fontDescription: ->
    this.selectedFontData().description
  templateSource: """
                  <div id='{{destinationId}}' class='{{selectedFont}}'>
                    <a href='{{link}}'><h1>{{fontName}}</h1></a>
                    <a href='{{link}}' class='link'>download</a>
                    {{{description}}}
                    <p>Back to the 
                      <a href="/">font list</a>.
                    </p>
                    <div id='code_box'>
                      <pre class='brush: {{selectedLanguage}}; gutter: false;'>{{snippet}}</pre>
                    </div>
                  </div>
                  """
  compileTemplate: ->
    template = Handlebars.compile(this.templateSource)
    rendered_html = template(this)
    $('#' + this.destinationId).replaceWith(rendered_html)
  higlightSyntax: ->
    SyntaxHighlighter.highlight()
  useSelectedFont: ->
    $('code').addClass(this.selectedFont)

$(->
  # Set up header area on load
  Progfonts.highlightSelectedLanguage()
  Progfonts.useSelectedTheme()

  # Theme changer click
  $('.theme_switcher a').click ->
    $(this).children('.bulbOn').toggle()
    Progfonts.toggleTheme()
    theme = if $('body').hasClass('light') then 'light' else 'dark'
    localStorage.setItem('selectedTheme', theme)
    false

  # Change language of code snippet without hitting the server
  $('.language_selector').click ->
    languageClicked = $(this).data().language
    localStorage.setItem('selectedLanguage', languageClicked)
    Progfonts.render()
    false
)
