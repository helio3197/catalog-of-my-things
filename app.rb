['./book',
 './game',
 './author',
 './game_methods',
 './author_methods',
 './music_album_methods',
 './music_album',
 './genre_methods',
 './genre',
 'json',
 'date',
 './book_methods',
 './label_methods',
 './label'].each do |file|
  require file
end

class App
  [BookMethod, LabelMethods, GameMethods, AuthorMethods, MusicAlbumMethods, GenreMethods].each do |method|
    include method
  end

  def initialize
    @books = []
    @labels = []
    @games = []
    @authors = []
    @music_albums = []
    @genres = []
  end

  def load_files
    load_books
    load_labels
  end

  def save_files
    save_books
    save_labels
    save_games
  end

  def valid_date?(date)
    date_format = '%Y-%m-%d'
    DateTime.strptime(date, date_format)
    true
  rescue ArgumentError
    false
  end

  def invalid?(option, max_value)
    return true if option.to_i > max_value || /\D/.match?(option)

    false
  end
end
