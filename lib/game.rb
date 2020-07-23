require_relative 'run'
require_relative 'board'
require_relative 'boardcase'
require_relative 'player'

class Game 
  attr_accessor :board, :players, :count
  
  def initialize(name_player1, name_player2)
    @board = Board.new 
    @players = [Player.new(name_player1, "X"),Player.new(name_player2, "O")]
    @count = 0
  end 

  def turn
    if @count % 2 == 0
      current_player = @players[0].symbol
    else 
      current_player = @players[1].symbol
    end
    @board.play_turn(current_player)
  end

  def to_s
    @board.print_board
  end 

  def play_game
    if @board.win == true && count > 4
      return true
    elsif count > 8
      puts "Vous êtes ex-aequo !"  
      self.start_new 
      return true
    else  
      return false
    end 
  end 

  def end_game 
      @board.print_board
      if count % 2 == 0 
        puts "Bravo #{players[1].name} tu as gagné !!!"
      else 
        puts "Bravo #{players[0].name} tu as gagné !!!"
      end
  end 

  def start_new
    puts "Voulez-vous redémarrer une partie ?"
    puts "Si Oui tape 'Y' sinon tape 'N'" 
    print ">" 
    response = gets.chomp.capitalize
    if response == "Y"
      new_game = RunAGame.new
      new_game.run_a_game
    elsif response == "N"
      puts "Salut à bientôt !"
    else 
      puts "Je crois que je n'ai pas compris :/"
      self.start_new
    end 
  end 

end