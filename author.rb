class Author
  attr_reader :first_name, :last_name, :id, :items

  def initialize(first_name, last_name, id = nil)
    @first_name = first_name
    @last_name = last_name
    @id = id || rand(1..1000)
    @items = []
  end

  def add_item(item)
    @items << item
    item.genre = self
  end
end
