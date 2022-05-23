require './item'

class Genre
  attr_reader :name
  attr_accessor :items

  def initialize(name)
    @name = name
    @id = rand(1..1000)
    @items = []
  end
end
