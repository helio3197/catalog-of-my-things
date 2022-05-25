require './author'

describe Author do
  context 'Tests for the Author methods' do
    before(:all) do
      @author = Author.new('Jhon', 'Doe', 14)
    end

    it 'The Author class should be instanceable' do
      expect(@author).to be_an_instance_of Author
    end

    it 'An Author object should contain a "first_name" attribute' do
      expect(@author.first_name).to eql 'Jhon'
    end

    it 'An Author object should contain a "last_name" attribute' do
      expect(@author.last_name).to eql 'Doe'
    end

    it 'An Author object should contain a working "add_item" method' do
      item = double('item')

      expect(item).to receive(:author=)

      @author.add_item(item)

      expect(@author.items[0]).to_not eql nil
    end
  end
end
