class Player
  attr_reader :name,
              :position,
              :salary

  def initialize(player_hash)
    @name = player_hash[:name]
    @position = player_hash[:position]
    @salary = player_hash[:salary]
  end
end
