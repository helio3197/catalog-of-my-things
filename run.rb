require './book'
require './label'
def run
  book = Book.new('publisher 1', 'hey cover', '10/19/2022')
  p book
  label = Label.new('title1', 'color1')
  label.add_item(book)
  p label
end
