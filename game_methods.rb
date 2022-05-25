module GameMethods
  def list_games
    return puts 'There are no games yet' if @games.empty?

    puts 'List of games:'
    @games.each_with_index do |game, index|
      puts "#{index + 1}) #{game.multiplayer} #{game.last_played_at}, id=#{game.id}"
    end
  end

  def game_details
    puts 'Please enter multiplayer mode:'
    print '> '
    multiplayer = gets.chomp
    last_played_at = nil
    loop do
      print "Please enter the last date when the game was played (yyyy-mm-dd)\n> "
      last_played_at = gets.chomp
      break if valid_date?(last_played_at)

      puts 'Invalid date format, please try again.'
    end
    publish_date = nil
    loop do
      print "Please provide publish date (yyyy-mm-dd)\n> "
      publish_date = gets.chomp
      break if valid_date?(publish_date)

      puts 'Invalid date format, please try again.'
    end
    puts 'Select an author from the list or create a new one'
    author = list_authors_to_select
    [multiplayer, last_played_at, publish_date, author]
  end

  def add_game
    multiplayer, last_played_at, publish_date, author = game_details

    return if author.nil?

    new_game = Game.new(multiplayer, last_played_at, publish_date)
    new_game.add_author(author)

    @games << new_game

    puts 'Game created sucessfully!'
  end

  def save_games
    File.write('games.json', @games.to_json)
  end

  def load_games
    games = File.exist?('games.json') ? JSON.parse(File.read('games.json')) : []
    games.each do |game|
      @games << Game.new(
        game['multiplayer'],
        game['last_played_at'],
        game['publish_date'],
        game['id'],
        archived: game['archived']
      )
    end
  end
end
