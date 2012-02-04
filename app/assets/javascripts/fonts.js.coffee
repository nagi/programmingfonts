window.Progfonts =
  fonts: 'To be set before calling renderTo().'
  languages: 'To be set ...'
  selectedFont: 'To be set ...'
  selectedLanguage: 'To be set ...'
  selectedFontData: ->
    Progfonts.fonts[Progfonts.selectedFont]
  selectedLanguageData: ->
    Progfonts.languages[Progfonts.selectedLanguage]
  fontName: ->
    Progfonts.selectedFontData().name
  fontDescription: ->
    Progfonts.selectedFontData().description
  snippet: ->
    Progfonts.selectedLanguageData().snippet
  templateSource: """
                  <div id='container' class='{{selectedFont}}'>
                    <h1>{{fontName}}</h1>
                    <pre class='brush: {{selectedLanguage}}'>{{snippet}}</pre>
                  </div>
                  """
  renderTo: ($id)->
    Progfonts.destination = $id
    $.getScript('/assets/' + this.selectedLanguageData().highlighter, Progfonts.compile)
  compile: ->
    template = Handlebars.compile(Progfonts.templateSource)
    rendered_html = template(Progfonts)
    Progfonts.destination.replaceWith(rendered_html)
    SyntaxHighlighter.highlight()
