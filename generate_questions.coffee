_ = require('./underscore.js')
{questionTemplates, interpolationSyntax} = require "./question_templates"

_.templateSettings =
  interpolate : interpolationSyntax


convert = (s, data) -> _.template(s) data

pp = (s, description) ->
  console.log JSON.stringify s, null, "  "

question_templates = questionTemplates.map (qt) ->
  questions = qt.variations().map (variation) ->
    stimulus: convert qt.stimulus, variation
    explanation: convert qt.explanation, variation
    correctAnswer: variation.correctAnswer
  questions: questions
  description: qt.description
  


pp question_templates

