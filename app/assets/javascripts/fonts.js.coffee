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
  getBrush: ->
    SyntaxHighlighter.autoloader('java /assets/shBrushJava.js')
  templateSource: """
                   <div id='container' class='{{selectedFont}}'>
                     <a href="/">Font List</a>
                     <h1>{{fontName}}</h1>
                     <pre class='brush: {{selectedLanguage}}'>{{snippet}}</pre>
                   </div>
                   """
  renderTo: ($id)=>
    # Progfonts.getBrush()
    template = Handlebars.compile(Progfonts.templateSource)
    rendered_html = template(Progfonts)
    $id.replaceWith(rendered_html)
    SyntaxHighlighter.highlight()
