_ = require('./underscore.js')

_.templateSettings =
  interpolate : /\{\{(.+?)\}\}/g

{questionTemplates} = require "./question_templates"

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

