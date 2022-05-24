require './game'
require './author'

['./book'].each do |file|
  require file
end

class App
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

  def create_author
    puts 'Enter first name:'
    print '> '
    first_name = gets.chomp
    puts 'Enter last name:'
    print '> '
    last_name = gets.chomp
    puts 'Author created successfully!'

    @authors << Author.new(first_name, last_name)
  end

  def list_authors_to_select
    puts '0) Create a new author'
    puts 'There are no authors yet' if @authors.empty?
    @authors.each_with_index do |author, index|
      puts "#{index + 1}) #{author.first_name} #{author.last_name}, id=#{author.id}"
    end
    print '> '
    selection = gets.chomp
    return print "Invalid option, try again.\n\n" if invalid?(selection, @authors.length)

    if selection == '0'
      create_author
      return list_authors_to_select
    end

    @authors[selection.to_i - 1]
  end

  def invalid?(option, max_value)
    return true if option.to_i >= max_value || /\D/.match?(option)

    false
  end

  def game_details
    puts 'Please enter multiplayer mode:'
    print '> '
    multiplayer = gets.chomp
    puts 'Please enter the last date when the game was played'
    print '> '
    last_played_at = gets.chomp
    puts 'Please provide publish date'
    print '> '
    publish_date = gets.chomp
    puts 'Select an author from the list or create a new one'
    author = list_authors_to_select
    [multiplayer, last_played_at, publish_date, author]
  end

  def add_game
    multiplayer, last_played_at, publish_date, author = game_details

    new_game = Game.new(multiplayer, last_played_at, publish_date)
    new_game.add_author(author)

    @games << new_game
  end
end
