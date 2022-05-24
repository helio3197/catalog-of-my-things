require './item'
require './genre'

describe Genre do
  before :each do
    @genre = Genre.new('Pop')
  end
  describe '#new' do
    it 'Should return a new Genre object' do
      expect(@genre).to be_an_instance_of Genre
    end
    it 'Should has a name' do
      expect(@genre.name).to eq 'Pop'
    end
  end
  describe '#add_item' do
    it 'Should have an item stored' do
      item = Item.new('2011-06-07')
      @genre.add_item(item)
      expect(@genre.items.length).to match 1
    end
  end
end
