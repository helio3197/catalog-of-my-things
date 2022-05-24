['./book', 'json', 'date'].each do |file|
  require file
end

def valid_date?(date)
  date_format = '%Y-%m-%d'
  DateTime.strptime(date, date_format)
  true
rescue ArgumentError
  false
end

def book_details
  puts 'Please provide book publisher'
  print '> '
  publisher = gets.chomp
  puts 'Please provide cover state'
  print '> '
  cover_state = gets.chomp
  publish_date = nil
  loop do
    puts 'Please provide publish date in the correct format (yyyy-mm-dd)'
    print '> '
    publish_date = gets.chomp
    break if valid_date?(publish_date)
  end
  [publisher, cover_state, publish_date]
end

class App
  def initialize
    @books = []
    @labels = []
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

  def add_book
    publisher, cover_state, publish_date = book_details
    @books << Book.new(publisher, cover_state, publish_date, false)
  end

  def load_books(filename = 'books.json')
    books = File.exist?(filename) ? JSON.parse(File.read(filename)) : []
    books.each do |book|
      @books << Book.new(book['publisher'], book['cover_state'], book['publish_date'], book['archived'], book['id'])
    end
  end

  def load_labels(filename = 'labels.json')
    labels = File.exist?(filename) ? JSON.parse(File.read(filename)) : []
    labels.each do |label|
      @labels << Label.new(label['title'], label['color'], label['id'], label['items'])
    end
  end

  def load_files
    load_books
    load_labels
  end

  def save_books(filename = 'books.json')
    File.write(filename, @books.to_json)
  end

  def save_labels(filename = 'label.json')
    File.write(filename, @labels.to_json)
  end

  def save_files
    save_books
    save_labels
  end
end
