join = (arr) ->
  if arr.length == 2
    "#{arr[0]} and #{arr[1]}"
  else
    last = arr.pop()
    "#{arr.join ", "}, and #{last}"

exports.questionTemplates = [
  {
    stimulus: '''
      For the system of values above, all terms are non-zero. 

      $$a = {b \\over {{ littleValue }} }$$
      $$b = {{ bigValue }}t$$
      $$a = mt$$

      What is the value of m?
      '''
    explanation: '''
      The correct answer is {{ correctAnswer}}. The first equation reads \\( a = {b \\over {{ littleValue }} } \\).
      Use the second equation and substitute {{ bigValue }}t for b.
      
      $$a = { {{ bigValue }}t \\over {{ littleValue }} } = {{ correctAnswer }}t$$

      The third equation reads \\(a = mt\\), so it follows that \\(m = {{ correctAnswer }}\\).
      '''
    description: "System of Equations"
    variations: ->
      parameterizations = [
        {
          bigValue: 9
          littleValue: 3
        }
        {
          bigValue: 10
          littleValue: 2
        }
        {
          bigValue: 18
          littleValue: 3
        }
      ]
      parameterizations.map (p) ->
        p.correctAnswer = p.bigValue / p.littleValue
        p
  },  
  
  {
    stimulus: '''
      The first two terms of a sequence are a and {{ jumpValue }}a, and each term after the
      first is {{ jumpValue }} times the preceding term.
      If the sum of the first four terms of the sequence is {{ bigSum }}, what is the value of a?
      '''
    explanation: '''
      Since each term is {{ jumpValue }} times the preceding term, the first four terms of this sequence are {{ terms }}.
      The sum of these four terms is {{ sum }}a. We're told that the first four terms add to {{ bigSum }},
      so we know that {{ sum }}a = {{ bigSum }}, which means:
      $$a = { {{ bigSum }} \\over {{ sum }} } = {{ correctAnswer }}$$
      '''
    description: "Geometric Sequences"
    variations: ->
      parameterizations = [
        {
          jumpValue: 4
          correctAnswer: 6
        }
        {
          jumpValue: 3
          correctAnswer: 7
        }
        {
          jumpValue: -2
          correctAnswer: -13
        }
      ]
      parameterizations.map (val) ->
        sum = 0
        n = 1
        elements = []
        for i in [0...4]
          sum += n
          elements.push "#{n}a"
          n *= val.jumpValue
        val.sum = sum
        val.terms = join elements
        val.bigSum = sum * val.correctAnswer
        val
        
  },
]
