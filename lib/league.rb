require "./lib/player"
require "./lib/team"

class League
  attr_reader :name,
              :teams

  def initialize(name)
    @name = name
    @teams = []
  end

  def add_team(team)
    @teams.push(team)
  end

  def captains
    @teams.map do |team|
      team.players.sort_by do |player|
        player.salary
      end.last
    end
  end

  def players_by_team
    player_team = Hash.new

    @teams.map do |team|
      player_team[team] = team.players.map do |player|
                            player.name
                          end
    end
    player_team
  end
end
