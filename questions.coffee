_ = require('./underscore.js')

_.templateSettings =
  interpolate : /\{\{(.+?)\}\}/g

{questionTemplates} = require "./question_templates"

convert = (s, data) -> _.template(s) data

pp = (s, description) ->
  console.log JSON.stringify s, null, "  "

for qt in questionTemplates
  for variation in qt.variations()
    pp
      stimulus: convert qt.stimulus, variation
      explanation: convert qt.explanation, variation
      correctAnswer: variation.correctAnswer
