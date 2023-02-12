# frozen_string_literal: true

require_relative 'display'

# Board class to set up board for game
class Board
  attr_accessor :board, :space

  include Display

  def initialize
    @board = Array.new(6) { Array.new(7) }
    @space = 42
  end

  def valid_input?(inp)
    if !inp.between?(0, 6) || @board[0][inp]
      error_player_input
      false
    else
      true
    end
  end

  def add_move(inp, symbol)
    i = 0
    i += 1 until @board[5 - i][inp].nil?

    @board[5 - i][inp] = symbol
    @space -= 1
    inp = [5 - i, inp]
    show_board(@board)
    winning?(inp, symbol)
  end

  def winning?(inp, symbol)
    return true if horizontal_win?(inp, symbol) || vertical_win?(inp, symbol)

    left_diagonal_win?(inp, symbol) || right_diagonal_win?(inp, symbol)
  end

  def horizontal_win?(inp, symbol)
    count = 0
    7.times do |i|
      @board[inp[0]][i] == symbol ? count += 1 : count = 0
      return true if count == 4
    end
    false
  end

  def vertical_win?(inp, symbol)
    count = 0
    6.times do |i|
      @board[i][inp[1]] == symbol ? count += 1 : count = 0
      return true if count == 4
    end
    false
  end

  def left_diagonal_win?(inp, symbol)
    c = inp[0] - inp[1]
    return false unless c.between?(-3, 2)

    count = 0
    6.times do |i|
      x = i - c
      break if x.negative?

      @board[i][x] == symbol ? count += 1 : count = 0
      return true if count == 4
    end
    false
  end

  def right_diagonal_win?(inp, symbol)
    c = inp[0] + inp[1]
    return false unless c.between?(3, 8)

    count = 0
    6.times do |i|
      x = c - i
      break if x.negative?

      @board[i][x] == symbol ? count += 1 : count = 0
      return true if count == 4
    end
    false
  end
end
