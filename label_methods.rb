module LabelMethods
  def save_labels(filename = 'label.json')
    File.write(filename, @labels.to_json)
  end

  def load_labels(filename = 'labels.json')
    labels = File.exist?(filename) ? JSON.parse(File.read(filename)) : []
    labels.each do |label|
      @labels << Label.new(label['title'], label['color'], label['id'], label['items'])
    end
  end

  def list_labels
    if @labels.empty?
      puts 'There are not available labels'
    else
      @labels.each { |label| puts "Title: #{label.title}, Color: #{label.color}" }
    end
  end
end
