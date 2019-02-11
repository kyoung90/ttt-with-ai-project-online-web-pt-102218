require_relative "players/human"
require "pry"

class Game

  WIN_COMBINATIONS = [
  [0,1,2],
  [3,4,5],
  [6,7,8],
  [0,3,6],
  [1,4,7],
  [2,5,8],
  [0,4,8],
  [2,4,6]
  ]

  attr_accessor :board, :player_1, :player_2

  def initialize(player_1 = Players::Human.new("X"), player_2 = Players::Human.new("O"), board = Board.new)
    self.player_1 = player_1
    self.player_2 = player_2
    self.board = board
  end

  def current_player
    if self.board.turn_count.even?
      self.player_1
    else
      self.player_2
    end
  end

  def won?
    WIN_COMBINATIONS.each do |row|
      if self.board.cells[row[0]] == "X" && self.board.cells[row[1]] == "X" && self.board.cells[row[2]] == "X"
        return row
      elsif self.board.cells[row[0]] == "O" && self.board.cells[row[1]] == "O" && self.board.cells[row[2]] == "O"
        return row
      end
    end
    false
  end

  def draw?
    if !self.won? && self.board.full?
      true
    else
      false
    end
  end

  def over?
    if self.draw? || self.won?
      return true
    end
    false
  end

  def winner
    if self.won?
      self.board.cells[self.won?.first]
    end
  end

  def turn
    # binding.pry
    puts "anything"
    input = current_player.move(@board)
    if self.board.valid_move?(input)
      # binding.pry
      # self.board.position(input) = self.current_player.token
    else
      # turn
    end
  end

end
