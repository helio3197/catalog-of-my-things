require './game'

['./book'].each do |file|
  require file
end

class App
  def initialize
    @books = []
    @labels = []
    @games = []
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
    [multiplayer, last_played_at, publish_date]
  end

  def add_game
    multiplayer, last_played_at, publish_date = game_details

    @games << Game.new(multiplayer, last_played_at, publish_date)
  end
end
