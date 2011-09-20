_ = require('./underscore.js')

handle_data = (data) ->
  console.log """
    <script type="text/javascript", src="https://d3eoax9i5htok0.cloudfront.net/mathjax/latest/MathJax.js?config=TeX-AMS-MML_HTMLorMML"></script>
    <body style="width: 500px; margin: auto">
    """
  
  question_templates = JSON.parse data
  for questions in question_templates
    for question in questions
      s = '''
        <hr>
        <h3>stimulus</h3>
        <div>{{ stimulus }}</div>
        <h3>Correct Answer</h3>
        <div>{{ correctAnswer }}</div>
        <h3>explanation</h3>
        <div>{{ explanation }}</div>
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