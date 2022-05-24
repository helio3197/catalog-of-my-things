['./book', './game', './author', './game_methods', './author_methods'].each do |file|
  require file
end

class App
  include GameMethods
  include AuthorMethods

  def initialize
    @books = []
    @labels = []
    @games = []
    @authors = []
  end

  def list_books
    if @books.empty?
      puts 'There are not available books'
    else
      @books.each { |book| puts "Publisher: #{book.publisher}" }
    end
  end

  def list_labels
    if @labels.empty?
      puts 'There are not available labels'
    else
      @labels.each { |label| puts "Title: #{label.title}, Color: #{label.color}" }
    end
  end

  def book_details
    puts 'Please provide book publisher'
    print '> '
    publisher = gets.chomp
    puts 'Please provide cover state'
    print '> '
    cover_state = gets.chomp
    puts 'Please provide publish date'
    print '> '
    publish_date = gets.chomp
    [publisher, cover_state, publish_date]
  end

  def add_book
    publisher, cover_state, publish_date = book_details
    @books << Book.new(publisher, cover_state, publish_date)
  end

  def invalid?(option, max_value)
    return true if option.to_i > max_value || /\D/.match?(option)

    false
  end

  def valid_date?(date)
    date_format = '%Y-%m-%d'
    DateTime.strptime(date, date_format)
    true
  rescue ArgumentError
    false
  end

end
