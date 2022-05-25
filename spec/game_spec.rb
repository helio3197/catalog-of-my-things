require './game'

describe Game do
  context 'Tests for Game instance methods' do
    before(:all) do
      @game = Game.new('co-op', '2021-05-21', '2015-05-10', 14)
    end

    it 'Should be instanceable' do
      expect(@game).to be_an_instance_of Game
    end

    it 'Should contain a "multiplayer" attribute' do
      expect(@game.multiplayer).to eql 'co-op'
    end

    it 'Should contain a "last_played_at" attribute' do
      expect(@game.last_played_at.to_s).to eql '2021-05-21'
    end

    it 'Should contain a "publish_date" attribute' do
      expect(@game.publish_date.to_s).to eql '2015-05-10'
    end

    it 'Should contain a "id" attribute' do
      expect(@game.id).to eql 14
    end

    it 'Should contain a "can_be_archived?" method' do
      expect(@game.can_be_archived?).to eql false
    end

    it 'Should contain a "move_to_archive" method' do
      expect(@game.move_to_archive).to eql nil
    end
  end
end
