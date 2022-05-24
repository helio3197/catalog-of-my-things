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
    puts 'select 2'
  when '3'
    app.list_games
    print "\n"
  when '4'
    puts 'select 4'
  when '5'
    app.list_labels
  when '6'
    app.list_authors
    print "\n"
  when '7'
    app.add_book
  when '8'
    puts 'select 8'
  when '9'
    app.add_game
    print "\n"
  when '10'
    puts 'select 10'
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
  loop do
    exec_options(print_options, app)
  end
end

main
