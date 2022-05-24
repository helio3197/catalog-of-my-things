require './app'

def print_options
  puts 'Please choose an option
1) List all books
2) List all music albums
3) List of games
4) List all genres
5) List all labels
6) List all authors
7) Add a book
8) Add a music album
9) Add a game
10) Quit'

  print '> '

  gets.chomp
end

# rubocop:disable Metrics/CyclomaticComplexity
# rubocop:disable Metrics/MethodLength
def exec_options(option, app)
  case option
  when '1'
    app.list_books
  when '2'
    app.list_music_albums
  when '3'
    app.list_games
  when '4'
    app.list_genres
  when '5'
    app.list_labels
  when '6'
    app.list_authors
  when '7'
    app.add_book
  when '8'
    app.add_music_album
  when '9'
    app.add_game
  when '10'
    puts 'Thanks for using this app!'
    app.save_files

    exit
  else
    print "Invalid option\n\n"
  end
end
# rubocop:enable Metrics/CyclomaticComplexity
# rubocop:enable Metrics/MethodLength

def main
  puts 'Catalog of my things'
  app = App.new
  app.load_files
  loop do
    exec_options(print_options, app)
    puts ''
  end
end

main
