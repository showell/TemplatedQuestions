_ = require('./underscore.js')

handle_data = (data) ->
  console.log "<html>"
  console.log """<head><meta http-equiv="Content-Type" content="text/html; charset=windows-1251"></head>"""
  question_templates = JSON.parse data
  for questions in question_templates
    for question in questions
      console.log "<hr>"
      console.log "<h3>stimulus</h3>"
      console.log "<div>#{question.stimulus}</div>"
      console.log "<div>Correct Answer: #{question.correctAnswer}</div>"
      console.log "<h3>explanation</h3>"
      console.log "<div>#{question.explanation}</div>"
  console.log "</html>"

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