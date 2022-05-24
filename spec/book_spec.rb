require './book'

describe Book do
  before :each do
    @book = Book.new('publisher 1', 'coverState', '2010-09-18')
  end

  it 'Return a book' do
    expect(@book).to be_an_instance_of Book
  end

  it 'Book should have a publisher' do
    expect(@book.publisher).to eq('publisher 1')
  end

  it 'Book should have a cover state' do
    expect(@book.cover_state).to eq('coverState')
  end
end
