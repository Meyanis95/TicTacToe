require_relative 'board'
require_relative 'boardcase'
require_relative 'game'
require_relative 'player'

class RunAGame

  def run_a_game
    system ("clear")
    puts "Bienvenue sur le jeu du Morpion"
    puts "Quel est le nom du joueur 1 (X)?"
    print ">" 
    name_player1 = gets.chomp 
    puts "Quel est le nom du joueur 2 (O)?"
    print ">" 
    name_player2 = gets.chomp 
    puts ""
    puts "Bienvenue #{name_player1} et #{name_player2}"

    my_game = Game.new(name_player1, name_player2) 
    puts "-"*20
    puts "Nous allons commencer à jouer"
    puts "Pour remplir une case tu dois renseigner la lettre de la ligne et le numéro de la colonne"
    puts "Par exemple A1 pour remplir la première case en haut à gauche"
    puts "Si tu selectionne une case déjà remplie ce la passe ton tour"
    puts "-"*20
    puts "Tape entre pour démarrer"
    puts "-"*20
    gets.chomp
    while my_game.play_game == false
      my_game.to_s
      if my_game.count % 2 == 0
        puts "#{my_game.players[0].name} (#{my_game.players[0].symbol}) c'est à toi de jouer"
      else  
        puts "#{my_game.players[1].name} (#{my_game.players[1].symbol}) c'est à toi de jouer"
      end 
      my_game.turn
      my_game.count += 1
    end 
    my_game.end_game
    my_game.start_new
  end

end 