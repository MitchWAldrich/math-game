class Turn

  def initialize(player)
    @player = player
    @number1 = rand(1..20)
    @number2 = rand(1..20)
    @answer = @number1 + @number2
  end

  def ask_question
    puts "#{@player}: What does #{@number1} plus #{@number2} equal?"
  end

  def correct_answer?(answer)
    @answer == answer.to_i
  end

end
