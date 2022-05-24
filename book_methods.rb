module BookMethod
  def book_details
    puts 'Please provide book publisher'
    print '> '
    publisher = gets.chomp
    puts 'Please provide cover state'
    print '> '
    cover_state = gets.chomp
    publish_date = nil
    loop do
      puts 'Please provide publish date (yyyy-mm-dd)'
      print '> '
      publish_date = gets.chomp
      break if valid_date?(publish_date)

      puts 'Invalid date format. Please try again.'
    end
    [publisher, cover_state, publish_date]
  end

  def list_books
    if @books.empty?
      puts 'There are not available books'
    else
      @books.each { |book| puts "Publisher: #{book.publisher}" }
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

  def save_books(filename = 'books.json')
    File.write(filename, @books.to_json)
  end
end
