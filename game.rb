require './player'
require './turn'
class Game
  attr_accessor :game_over
  
  def initialize
    @game_over
    @turn
    @player1
    @player2
  end
  
  def start_game
    @game_over = false
    @turn = 1
    @player1 = Player.new('Player 1')
    puts "Player 1, input name:"
    @player1.name = $stdin.gets.chomp
    
    @player2 = Player.new('Player 2')
    puts "Player 2, input name:"
    @player2.name = $stdin.gets.chomp
    
    @players = [@player1, @player2]
  
    puts "Welcome to the game. Good luck!"
    
    while @game_over == false do
      answering_player = @players[@turn % 2]
      asking_player = @players[@turn % 2 - 1]
      question = Turn.new(asking_player.name)
      question.ask_question
      answer = gets.chomp
  
      if question.correct_answer?(answer)
        puts "YES! You are correct."
      else
        puts "Seriously? No!"
        answering_player.lose_a_life
      end
      
      if @player1.lives == 0 || @player2.lives == 0
        @game_over = true
      end
  
      if @game_over == false
        puts "#{@player1.name}: #{@player1.lives}/3 vs #{@player2.name}: #{@player2.lives}/3"
    
        @turn += 1
        puts "----- NEW TURN -----"
      end
  
    end
    
    if @player1.lives == 0
      puts "#{@player2.name} wins with a score of #{@player2.lives}/3"  
    elsif  @player2.lives == 0
      puts "#{@player1.  name} wins with a score of #{@player1.lives}/3"
    end
    
    puts "----- GAME OVER -----"
    puts "Good bye!"

  end
end