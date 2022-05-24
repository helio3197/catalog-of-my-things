require 'date'
require './item'

class Game < Item
  attr_reader :multiplayer, :last_played_at

  def initialize(multiplayer, last_played_at, publish_date)
    super(publish_date)
    @multiplayer = multiplayer
    @last_played_at = Date.strptime(last_played_at, '%Y-%m-%d')
  end

  def can_be_archived?
    super && @last_played_at < Date.new(Date.today.year - 2, Date.today.month, Date.today.day)
  end
end
