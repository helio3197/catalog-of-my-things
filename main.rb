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
def exec_options(option)
  case option
  when '1'
    puts 'select 1'
  when '2'
    puts 'select 2'
  when '3'
    puts 'select 3'
  when '4'
    puts 'select 4'
  when '5'
    puts 'select 5'
  when '6'
    puts 'select 6'
  when '7'
    puts 'select 7'
  when '8'
    puts 'select 8'
  when '9'
    puts 'select 9'
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

  loop do
    exec_options(print_options)
  end
end

main
