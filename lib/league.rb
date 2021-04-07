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

  def most_expensive_player
    captain_by_team = @teams.map do |team|
      team.players.sort_by do |player|
        player.salary
      end.last
    end
    captain_by_team.sort_by do |player|
      player.salary
    end.last.name
  end

  def players_by_salary_range
    all_players = @teams.map do |team|
      team.players
    end.flatten
    range_top = all_players.max_by do |player|
      player.salary
    end.salary/1000000
    salary_hash = Hash.new {|hash, key| hash[key] = []}
    (range_top + 1).times do |i|
      salary_hash["Over #{i}M"]
    end
    all_players.map do |player|
      salary_hash["Over #{player.salary/1000000}M"] << player.name
    end
    salary_hash
  end
end
