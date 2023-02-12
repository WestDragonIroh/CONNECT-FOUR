# frozen_string_literal: true

require_relative 'game'

INTRO = <<~HEREDOC

  \e[1;95mWelcome to Connect Four! （￣︶￣）↗　\e[0m

  \e[93mThis is a PvP game. The objective of the game is to be the first to form a horizontal, vertical, or diagonal line of four of one's own tokens\e[0m

HEREDOC

puts INTRO

play = true
while play
  game = Game.new
  game.play
  play = game.new_game
end

THANKS = <<~HEREDOC

  \e[1;95mThanks for playing ＜（＾－＾）＞ \e[0m
HEREDOC

puts THANKS
