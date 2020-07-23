class Board
    attr_accessor :board

  def initialize
    @board = [BoardCase.new("A1"),BoardCase.new("A2"),BoardCase.new("A3"),
              BoardCase.new("B1"),BoardCase.new("B2"),BoardCase.new("B3"),
              BoardCase.new("C1"),BoardCase.new("C2"),BoardCase.new("C3")]
  end 

  def print_board
    puts "    1   2   3 "
    puts "A | #{@board[0].content} | #{@board[1].content} | #{@board[2].content} |"
    puts "  |---|---|---|"
    puts "B | #{@board[3].content} | #{@board[4].content} | #{@board[5].content} |"
    puts "  |---|---|---|"
    puts "C | #{@board[6].content} | #{@board[7].content} | #{@board[8].content} |" 
  end 

  def play_turn(current_player)
    puts "Quelle case veux-tu jouer ?"
    print ">"
    move_position = gets.chomp.capitalize
    @board.each do |i|
      if i.position == move_position && i.content == " "
        if current_player == "X"
          i.content = "X"
        elsif current_player == "O"
          i.content = "O"
        end
      end
    end 
  end 

  def win
    if (@board[0].content == @board[1].content && @board[0].content == @board[2].content) || (@board[3].content == @board[4].content && @board[3].content == @board[5].content) || (@board[6].content == @board[7].content && @board[6].content == @board[8].content) || (@board[0].content == @board[3].content && @board[0].content == @board[6].content) || (@board[1].content == @board[4].content && @board[1].content == @board[7].content) || (@board[2].content == @board[5].content && @board[2].content == @board[8].content) || (@board[0].content == @board[4].content && @board[0].content == @board[8].content) || (@board[2].content == @board[4].content && @board[2].content == @board[6].content)
      return true
    else
      return false
    end
  end


end 