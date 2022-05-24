['./book', 'json', 'date', './book_methods'].each do |file|
  require file
end

class App
  [BookMethod].each do |method|
    include method
  end

  def initialize
    @books = []
    @labels = []
  end

  def load_files
    load_books
    load_labels
  end

  def save_files
    save_books
    save_labels
  end

  def valid_date?(date)
    date_format = '%Y-%m-%d'
    DateTime.strptime(date, date_format)
    true
  rescue ArgumentError
    false
  end
end
