# frozen_string_literal: true

require_relative '../lib/board'

describe Board do
  describe '#horizontal_win?' do
    context 'for horizonatally 4 consicutive same symbols' do
      it 'return true' do
        board = Board.new
        board.board[0][0] = board.board[0][1] = board.board[0][2] = board.board[0][3] = 1
        expect(board.horizontal_win?([0, 0], 1)).to be true
      end

      it 'return true' do
        board = Board.new
        board.board[5][3] = board.board[5][4] = board.board[5][5] = board.board[5][6] = 1
        expect(board.horizontal_win?([5, 6], 1)).to be true
      end

      it 'return true' do
        board = Board.new
        board.board[0][1] = board.board[0][2] = board.board[0][4] = board.board[0][5] = 1
        expect(board.horizontal_win?([0, 3], 1)).to be false
      end
    end
  end
end

describe Board do
  describe '#vertical_win?' do
    it 'return true for vertically 4 consicutive same symbols' do
      board = Board.new
      board.board[1][0] = board.board[2][0] = board.board[3][0] = board.board[4][0] = 1
      expect(board.vertical_win?([0, 0], 1)).to be true
    end
  end
end

describe Board do
  describe '#left_diagonal_win' do
    it 'return true for left diagonal 4 consicutive same symbols' do
      board = Board.new
      board.board[5][6] = board.board[4][5] = board.board[3][4] = 1 # board.board[2][3] = 1
      expect(board.left_diagonal_win?([4, 5], 1)).to be false
    end
  end
end

describe Board do
  describe '#right_diagonal_win' do
    it 'return true for right diagonal 4 consicutive same symbols' do
      board = Board.new
      board.board[0][6] = board.board[1][5] = board.board[2][4] = board.board[3][3] = 1
      expect(board.right_diagonal_win?([1, 5], 1)).to be true
    end
  end
end
