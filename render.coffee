_ = require('./underscore.js')

handle_data = (data) ->
  console.log """
    <script type="text/javascript", src="https://d3eoax9i5htok0.cloudfront.net/mathjax/latest/MathJax.js?config=TeX-AMS-MML_HTMLorMML"></script>
    <body style="width: 400px; margin: auto">
    """
  
  question_templates = JSON.parse data
  for qt in question_templates
    console.log "<h1>#{qt.description}</h1>"
    console.log "(#{qt.questions.length} variations)"
    for question in qt.questions
      s = '''
        <div style="padding: 20px">
          <hr>
          <h3>Stimulus</h3>
          <div>{{ stimulus }}</div>
          <h3>Correct Answer</h3>
          <div>{{ correctAnswer }}</div>
          <h3>Explanation</h3>
          <div>{{ explanation }}</div>
        </div>
      '''
      console.log convert s, question
    

_.templateSettings =
  interpolate : /\{\{(.+?)\}\}/g

convert = (s, data) -> _.template(s) data

pp = (s, description) ->
  console.log JSON.stringify s, null, "  "

data = ''
stdin = process.openStdin()
stdin.on 'data', (buffer) ->
  data += buffer.toString() if buffer
stdin.on 'end', ->
  handle_data(data)