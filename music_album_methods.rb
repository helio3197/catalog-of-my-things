module MusicAlbumMethods
  def list_music_albums
    return puts 'There are no music albums yet' if @music_albums.empty?

    puts 'List of music albums:'
    @music_albums.each_with_index do |album, index|
      spotify = 'No'
      spotify = 'Yes' if album.on_spotify
      puts "#{index + 1}) On Spotify: #{spotify}, Publish date: #{album.publish_date}, ID=#{album.id}"
    end
  end

  def on_spotify?
    loop do
      print "Is the album on Spotify? [Y/N]\n> "
      input = gets.chomp.downcase
      case input
      when 'y'
        return true
      when 'n'
        return false
      else
        puts 'Wrong value. Please try again'
      end
    end
  end

  def add_music_album
    spotify = on_spotify?
    archived = false
    publish_date = nil
    loop do
      print "Please provide publish date (yyyy-mm-dd)\n> "
      publish_date = gets.chomp
      break if valid_date?(publish_date)

      puts 'Invalid date format, please try again.'
    end
    new_album = MusicAlbum.new(spotify, publish_date, archived)
    @music_albums << new_album
    puts 'Music album created sucessfully!'
  end
end
