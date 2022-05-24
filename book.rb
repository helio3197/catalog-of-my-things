require './item'

class Book < Item
  attr_reader :publisher, :cover_state

  def initialize(publisher, cover_state, publish_date, archived, id = rand(1000))
    super(publish_date, archived: archived)
    @id = id
    @publisher = publisher
    @cover_state = cover_state
  end

  def can_be_archived?()
    super || cover_state == 'bad'
  end
end
