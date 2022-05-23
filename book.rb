require './item'

class Book < Item
  def initialize(publisher, cover_state, publish_date)
    super(publish_date)
    @id = id
    @publisher = publisher
    @cover_state = cover_state
  end

  def can_be_archived?()
    super || cover_state == 'bad'
  end
end
