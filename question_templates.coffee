join = (arr) ->
  if arr.length == 2
    "#{arr[0]} and #{arr[1]}"
  else
    last = arr.pop()
    "#{arr.join ", "}, and #{last}"

exports.questionTemplates = [
  {
    stimulus: '''
      A new college student is randomly assigned to one of {{ big }} dorm rooms.
      The student has an equal chance of receiving each of the rooms as an assignment.
      If exactly {{ small }} of the rooms are painted {{ color }}, what is the probability that 
      the student will be assigned a room that is painted {{ color }}?
      '''
    explanation: '''
      The probability of a particular event is given by the ratio of the number of situations in which that event is true 
      to the number of total possible situations. 
      
      In this case, there are {{ small }} ways that the student can receive a {{ color }} room 
      ({{ small }} of the rooms are painted {{ color }}), while there are {{ big }} total possibilities (each of the dorm rooms).  
      The probability is {{ small }}/{{ big }}. Dividing top and bottom by {{ small }} gives us 1/{{ quotient }}.
      '''
    description: "Probability"
    variations: ->
      parameterizations = [
        {
          small: 24
          big: 120
          color: "yellow"
        },
        {
          small: 14
          big: 56
          color: "orange"
        }
        {
          small: 19
          big: 190
          color: "blue"
        }
      ]
      
      parameterizations.map (p) ->
        p.quotient = p.big / p.small
        p.correctAnswer = p.small / p.big
        p
  }  
  
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
