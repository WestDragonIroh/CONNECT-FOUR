# frozen_string_literal: true

require_relative '../lib/display'

describe Display do
  let(:dummy) { Class.new { extend Display } }
  before do
    allow(dummy).to receive(:puts).and_return(dummy)
  end

  describe '#new_game' do
    it 'returns true for input y' do
      allow(dummy).to receive(:gets).and_return("y\n")
      expect(dummy.new_game).to be true
    end

    it 'returns false for input n' do
      allow(dummy).to receive(:gets).and_return("N\n")
      expect(dummy.new_game).to be false
    end
  end
end
