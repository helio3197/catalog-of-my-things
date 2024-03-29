class Author
  attr_reader :first_name, :last_name, :id, :items

  def initialize(first_name, last_name, id = rand(1..1000))
    @first_name = first_name
    @last_name = last_name
    @id = id
    @items = []
  end

  def add_item(item)
    @items << item
    item.author = self
  end

  def to_json(*_args)
    {
      first_name: @first_name,
      last_name: @last_name,
      items: @items.map(&:id),
      id: @id
    }.to_json
  end
end
