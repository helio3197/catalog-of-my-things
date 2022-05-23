require './item'

class MusicAlbum < Item
  attr_reader :on_spotify

  def initialize(on_spotify, publish_date)
    super(id, publish_date, archived)
    @on_spotify = on_spotify
  end
end
