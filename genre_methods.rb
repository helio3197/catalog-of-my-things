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

  def save_genres
    File.write('./data/genres.json', @genres.to_json)
  end

  def load_genres
    genres = File.exist?('./data/genres.json') ? JSON.parse(File.read('./data/genres.json')) : []
    genres.each do |genre|
      new_genre = Genre.new(genre['name'], genre['id'])
      genre['items'].each do |id|
        matched_item = @music_albums.reduce do |result, item|
          result = item if item == id
          result
        end
        matched_item.add_genre(new_genre)
      end
      @genres << new_genre
    end
  end
end
