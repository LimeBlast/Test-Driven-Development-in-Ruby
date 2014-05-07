class Team

  attr_accessor :name, :players

  def initialize(name, players = [])
    raise Exception unless players.is_a? Array

    @name = name
    @players = players
  end

end