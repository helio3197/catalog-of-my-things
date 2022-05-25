module LabelMethods
  def save_labels(filename = './data/labels.json')
    File.write(filename, @labels.to_json)
  end

  def load_labels(filename = './data/labels.json')
    labels = File.exist?(filename) ? JSON.parse(File.read(filename)) : []
    labels.each do |label|
      @labels << Label.new(label['title'], label['color'], label['id'], label['items'])
    end
  end

  def list_labels
    if @labels.empty?
      puts 'There are not available labels.'
    else
      @labels.each_with_index { |label, index| puts "#{index + 1}) Title: #{label.title}, Color: #{label.color}" }
    end
  end

  def create_label
    puts 'Enter the title of the label'
    print '> '
    title = gets.chomp
    puts 'Enter the color of the label'
    print '> '
    color = gets.chomp
    @labels << Label.new(title, color)
    puts 'Label created successfully!'
  end

  def select_label
    selection = nil
    loop do
      if @labels.length.zero?
        puts "\nCreate a new label"
        create_label
      end
      puts '0) Create a new label'
      list_labels
      print '> '
      selection = gets.chomp
      if selection == '0'
        create_label
        select_label
      end
      invalid?(selection, @labels.length) ? print("Invalid option, try again.\n\n") : break
    end
    @labels[selection.to_i - 1]
  end
end
