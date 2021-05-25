require './player.rb'
class Game 

  def initialize
    player1 = Person.new("Player 1")
    player2 = Person.new("Player 2")
    game_loop(player1, player2)
    
  end

  def game_loop(player1, player2)
    puts "----- GAME START ------"
    turn_counter = 0
    while player1.lives > 0 && player2.lives > 0 do
      if turn_counter % 2 == 0
        turn(player1)
        if player1.lives <= 0 
          win(player2)
          return
        end
      else
        turn(player2)
        if player2.lives <= 0 
          win(player1)
          return
        end
      end
      puts "P1: #{player1.lives}/3 vs P2: #{player2.lives}/3"
      turn_counter += 1
    end
  end

  def turn(player)
    puts "----- NEW TURN -----"
    print "#{player.name}: "
    answer = question
    player_answer = gets.chomp.to_i
    print "#{player.name}: "
    if answer == player_answer
      puts "Correct!"
    else
      puts "NO! you dummy!"
      player.lives = player.lives - 1
    end
  end

  def question
    num1 = (rand()*21).floor()
    num2 = (rand()*21).floor()
    puts "What does #{num1} plus #{num2} equal?"
    num1 + num2
  end

  def win(winner)
    puts "#{winner.name} wins with a score of #{winner.lives}/3"
    puts "----- GAME OVER -----"
    puts "Good bye!"
  end

end