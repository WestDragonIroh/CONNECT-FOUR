# frozen_string_literal: true

# Module to handle all the display functions
module Display
  extend self

  COLOR = {
    nil => "\e[1;97m\u25cf \e[0m",
    1 => "\e[33m\u25cf \e[0m",
    2 => "\e[34m\u25cf \e[0m"
  }.freeze

  def new_game
    puts <<~HEREDOC
      \e[97mDo you want to play again?\e[0m
      \e[92m[y] Play another round\e[0m
      \e[31m[n] Exit\e[0m
    HEREDOC

    case gets.chomp.downcase
    when 'y' then return true
    when 'n' then return false
    else error_message end
    new_game
  end

  def instruction
    instruct = <<~HEREDOC
      \e[96mChoose the player names and then on each turn select the column (1-7) for token. Press q to exit anytime
      Type any key to continue\e[0m
    HEREDOC
    puts instruct
    gets
  end

  def error_message
    puts "\e[31mError: Enter correct choice\e[0m"
  end

  def player_seletion(num)
    puts "\e[97mEnter name of #{num} player\e[0m"
    gets.chomp.downcase.capitalize
  end

  def player_input(player)
    puts "#{COLOR[player.symbol]} \e[97m#{player.name}'s turn\e[0m"
    inp = gets.chomp
    return inp if inp.eql?('q')

    inp.to_i - 1
  end

  def error_player_input
    puts "\e[31mError: Enter column which is free from 1-7\e[0m"
  end

  def show_board(board)
    board.each do |row|
      row.each do |elm|
        print COLOR[elm]
      end
      print "\n"
    end
    puts "\e[1;97m#{(1..7).to_a.join(' ')} \e[0m"
  end

  def winner_player(player)
    puts ''
    puts "\e[95m#{player.name} won! o(*^＠^*)o \e[0m"
    puts ''
  end

  def game_draw
    puts ''
    puts "\e[92mThe game is draw.\e[0m"
    puts ''
  end
end
