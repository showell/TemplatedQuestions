_ = require('./underscore.js')

_.templateSettings =
  interpolate : /\{\{(.+?)\}\}/g

{questionTemplates} = require "./question_templates"

convert = (s, data) -> _.template(s) data

pp = (s, description) ->
  console.log JSON.stringify s, null, "  "

questions = questionTemplates.map (qt) ->
  qt.variations().map (variation) ->
    stimulus: convert qt.stimulus, variation
    explanation: convert qt.explanation, variation
    correctAnswer: variation.correctAnswer

pp questions
