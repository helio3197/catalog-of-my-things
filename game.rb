require 'date'
require './item'

class Game < Item
  attr_reader :multiplayer, :last_played_at

  def initialize(multiplayer, last_played_at, publish_date, id = rand(1..1000), archived: false)
    super(publish_date, id, archived: archived)
    @multiplayer = multiplayer
    @last_played_at = Date.strptime(last_played_at, '%Y-%m-%d')
  end

  def can_be_archived?
    super && @last_played_at < Date.new(Date.today.year - 2, Date.today.month, Date.today.day)
  end

  def to_json(*_args)
    {
      multiplayer: @multiplayer,
      last_played_at: @last_played_at.to_s,
      publish_date: @publish_date.to_s,
      archived: @archived,
      id: @id
    }.to_json
  end
end
