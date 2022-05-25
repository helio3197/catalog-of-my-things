require './item'

class MusicAlbum < Item
  attr_reader :on_spotify

  def initialize(on_spotify, publish_date, archived, id = rand(1..1000))
    super(publish_date, id, archived: archived)
    @on_spotify = on_spotify
  end

  def can_be_archived?
    super && @on_spotify
  end

  def to_json(*_args)
    {
      on_spotify: @on_spotify,
      publish_date: @publish_date,
      archived: @archived,
      id: @id
    }.to_json
  end
end
