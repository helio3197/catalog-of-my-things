module GenreMethods
  def list_genres
    return puts 'There are no genres yet' if @genres.empty?

    puts 'List of genres:'
    @genres.each_with_index do |genre, index|
      puts "#{index + 1}) Name: #{genre.name}, ID=#{genre.id}"
    end
  end

  def create_genre
    print "Enter genre name:\n> "
    name = gets.chomp

    @genres << Genre.new(name)
    puts 'Genre created successfully!'
  end

  def list_genre_to_select
    selection = nil
    loop do
      puts '0) Create a new genre'
      list_genres
      print '> '
      selection = gets.chomp

      if selection == '0'
        create_genre
        next
      end

      invalid?(selection, @genres.length) ? print("Invalid option, try again.\n\n") : break
    end
    @genres[selection.to_i - 1]
  end
end
