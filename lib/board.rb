class Board
  attr_accessor :cells

  def reset!
    self.cells = [" ", " ", " ", " ", " ", " ", " ", " ", " "]
  end
  # @cells = [" ", " ", " ", " ", " ", " ", " ", " ", " "]

  def initialize
    self.cells = [" ", " ", " ", " ", " ", " ", " ", " ", " "]
  end

  def display
    puts " #{cells[0]} | #{cells[1]} | #{cells[2]} "
    puts "-----------"
    puts " #{cells[3]} | #{cells[4]} | #{cells[5]} "
    puts "-----------"
    puts " #{cells[6]} | #{cells[7]} | #{cells[8]} "
  end

  def position(input)
    self.cells[input.to_i - 1]
  end

  def full?
    self.cells.each do |cell|
      if cell == " "
        return false
      end
    end
    true
  end

  def turn_count
    counter = 0
    self.cells.each do |cell|
      if cell != " "
        counter += 1
      end
    end
    counter
  end

  def taken?(position)
    if self.cells[position.to_i-1] != " "
      return true
    end
    false
  end

  def valid_move?(input)
    if input.to_i >= 1 && input.to_i <= 9 && !taken?(input)
      true
    else
      false
    end
  end

  def update(input, player)
    self.cells[input.to_i - 1] = player.token
  end

end
