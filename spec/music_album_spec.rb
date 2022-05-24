require './music_album'

describe MusicAlbum do
  before :each do
    @album = MusicAlbum.new(true, '2010-02-05', false)
  end
  describe '#new' do
    it 'Should return a new MusicAlbum object' do
      expect(@album).to be_an_instance_of MusicAlbum
    end

    it 'Should have a publish_date' do
      expect(@album.publish_date.strftime('%Y-%m-%d')).to eq('2010-02-05')
    end

    it 'Should not be archived' do
      expect(@album.archived).to be_falsy
    end
  end

  describe '#can_be_archived?' do
    it 'Should return true' do
      expect(@album.can_be_archived?).to be_truthy
    end
  end
end
