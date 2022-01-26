# frozen_string_literal: true

# Class for playing a game of Tic-Tac-Toe
class TicTacToe
  def initialize
    @gameboard = [' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ']
    @player = 'Crosses'
    @game_won = 0
  end

  def read_game_won
    @game_won
  end

  def whos_move
    print "\n\n\n#{@player} to make a move... \n\n"
  end

  def print_board
    print "\n\n\n"
    print "#{@gameboard[0]} | #{@gameboard[1]} | #{@gameboard[2]} \n"
    print "---------\n"
    print "#{@gameboard[3]} | #{@gameboard[4]} | #{@gameboard[5]} \n"
    print "---------\n"
    print "#{@gameboard[6]} | #{@gameboard[7]} | #{@gameboard[8]} \n"
  end

  def read_player
    @player
  end

  def victory_condition
    checkboard_cross = ['X', 'X', 'X']
    checkboard_nought = ['O', 'O', 'O']

    gameboard_vertical1 = @gameboard[0] + @gameboard[3] + @gameboard[6]
    gameboard_vertical1 = gameboard_vertical1.split(//)
    gameboard_vertical2 = @gameboard[1] + @gameboard[4] + @gameboard[7]
    gameboard_vertical2 = gameboard_vertical2.split(//)
    gameboard_vertical3 = @gameboard[2] + @gameboard[5] + @gameboard[8]
    gameboard_vertical3 = gameboard_vertical3.split(//)
    gameboard_diagonal1 = @gameboard[0] + @gameboard[4] + @gameboard[8]
    gameboard_diagonal1 = gameboard_diagonal1.split(//)
    gameboard_diagonal2 = @gameboard [2] + @gameboard[4] + @gameboard[6]
    gameboard_diagonal2 = gameboard_diagonal2.split(//)

    if @gameboard[0..2] == checkboard_cross || @gameboard[0..2] == checkboard_nought
      @game_won = 1
    elsif @gameboard[3..5] == checkboard_cross || @gameboard[3..5] == checkboard_nought
      @game_won = 1
    elsif @gameboard[6..8] == checkboard_cross || @gameboard[6..8] == checkboard_nought
      @game_won = 1
    elsif gameboard_vertical1 == checkboard_cross || gameboard_vertical1 == checkboard_nought
      @game_won = 1
    elsif gameboard_vertical2 == checkboard_cross || gameboard_vertical2 == checkboard_nought
      @game_won = 1
    elsif gameboard_vertical3 == checkboard_cross || gameboard_vertical3 == checkboard_nought
      @game_won = 1
    elsif gameboard_diagonal1 == checkboard_cross || gameboard_diagonal1 == checkboard_nought
      @game_won = 1
    elsif gameboard_diagonal2 == checkboard_cross || gameboard_diagonal2 == checkboard_nought
      @game_won = 1
    else
      @game_won = 0
    end
  end

  def move
    move = gets.to_i
    if move >= 1 && move <= 9 && @player == "Crosses" && @gameboard[move - 1] == ' '
      @gameboard[move - 1] = 'X'
      @player = "Noughts"
    elsif move >= 1 && move <= 9 && @player == "Noughts" && @gameboard[move - 1] == ' '
      @gameboard[move - 1] = 'O'
      @player = "Crosses"
    else
      puts 'Invalid Move!'
    end
  end
end

game = TicTacToe.new

# Main game loop of Tic-Tac-Toe
while game.read_game_won.zero?
  game.whos_move
  game.print_board
  game.move
  game.victory_condition
end


game.print_board
puts "\n\n\n"
if game.read_player == "Crosses"
  puts 'Noughts have won with three in a row, column or diagonal!'
else
  puts 'Crosses have won with three in a row, column or diagonal!'
end
