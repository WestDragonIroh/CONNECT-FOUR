# frozen_string_literal: true

# Class to make Player objects
class Player
  attr_accessor :name, :symbol

  def initialize(name = nil, symbol = nil)
    @name = name
    @symbol = symbol
  end
end
