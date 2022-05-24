module AuthorMethods
  def list_authors
    return puts 'There are no authors yet' if @authors.empty?

    puts 'List of authors:'
    @authors.each_with_index do |author, index|
      puts "#{index + 1}) #{author.first_name} #{author.last_name}, id=#{author.id}"
    end
  end

  def create_author
    puts 'Enter first name:'
    print '> '
    first_name = gets.chomp
    puts 'Enter last name:'
    print '> '
    last_name = gets.chomp
    puts 'Author created successfully!'

    @authors << Author.new(first_name, last_name)
  end

  def list_authors_to_select
    selection = nil
    loop do
      puts '0) Create a new author'
      list_authors
      print '> '
      selection = gets.chomp

      if selection == '0'
        create_author
        next
      end

      invalid?(selection, @authors.length) ? print("Invalid option, try again.\n\n") : break
    end
    @authors[selection.to_i - 1]
  end
end
