# frozen_string_literal: true

require_relative 'board'
require_relative 'player'
require_relative 'display'

# Class to setup game
class Game
  attr_accessor :board, :player1, :player2, :turn

  include Display

  def initialize
    @board = Board.new
    @player1 = Player.new('A', 1)
    @player2 = Player.new('B', 2)
  end

  def play
    instruction
    selection
    start
  end

  def selection
    @player1 = Player.new(player_seletion(1), 1)
    @player2 = Player.new(player_seletion(2), 2)
  end

  def start
    @turn = false
    loop do
      win = @turn ? player_turn(@player2) : player_turn(@player1)
      return if win

      return game_draw if board.space.zero?

      @turn = !@turn
    end
  end

  def player_turn(player)
    return true if board.space.zero?

    inp = nil
    loop do
      inp = player_input(player)
      return inp if 'q'.eql?(inp)
      break if board.valid_input?(inp)
    end
    win = board.add_move(inp, player.symbol)
    winner_player(player) if win
    win
  end
end
