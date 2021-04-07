require "./lib/player"
require "./lib/team"
require "./lib/league"

RSpec.describe "League" do
  describe "#initialize" do
    it "creates an instance of a league" do
      rainbow_cup = League.new("Rainbow Cup")

      expect(rainbow_cup.class).to eq(League)
    end
    it "has a name" do
      rainbow_cup = League.new("Rainbow Cup")

      expect(rainbow_cup.name).to eq("Rainbow Cup")
    end
    it "starts without any teams" do
      rainbow_cup = League.new("Rainbow Cup")

      expect(rainbow_cup.teams).to eq([])
    end
  end
  describe "#add_team" do
    it "adds a team to the teams array" do
      rainbow_cup = League.new("Rainbow Cup")

      dwight = Player.new({name: "Dwight Shrute", position: "Midfield", salary: 1_000_000})
      rocky = Player.new({name: "Rocky Malone", position: "Pitcher", salary: 1_502_000})
      richard = Player.new({name: "Richard Doe", position: "Accountant", salary: 43_000})
      the_beats = Team.new("The Beats", "Tim Winner", [dwight, rocky, richard])

      rainbow_cup.add_team(the_beats)

      expect(rainbow_cup.teams).to eq([the_beats])
    end
    it "adds more teams to the end of the team array" do
      rainbow_cup = League.new("Rainbow Cup")

      dwight = Player.new({name: "Dwight Shrute", position: "Midfield", salary: 1_000_000})
      rocky = Player.new({name: "Rocky Malone", position: "Pitcher", salary: 1_502_000})
      richard = Player.new({name: "Richard Doe", position: "Accountant", salary: 43_000})
      the_beats = Team.new("The Beats", "Tim Winner", [dwight, rocky, richard])

      shifty = Player.new({name: "Shifty Doe", position: "Dark Alley", salary: 330_000})
      beagle = Player.new({name: "Beagle Dog", position: "Good Boy", salary: 3_000_001})
      bob = Player.new({name: "Bob McBobby", position: "The Bobster", salary: 1_111_111})
      the_bestfriends = Team.new("The the_bestfriends", "Tim Winner", [shifty, beagle, bob])

      rainbow_cup.add_team(the_beats)
      rainbow_cup.add_team(the_bestfriends)

      expect(rainbow_cup.teams).to eq([the_beats, the_bestfriends])
    end
  end
  describe "#captains" do
    it "displays an array of the captain player instances" do
      rainbow_cup = League.new("Rainbow Cup")

      dwight = Player.new({name: "Dwight Shrute", position: "Midfield", salary: 1_000_000})
      rocky = Player.new({name: "Rocky Malone", position: "Pitcher", salary: 1_502_000})
      richard = Player.new({name: "Richard Doe", position: "Accountant", salary: 43_000})
      the_beats = Team.new("The Beats", "Tim Winner", [dwight, rocky, richard])

      shifty = Player.new({name: "Shifty Doe", position: "Dark Alley", salary: 330_000})
      beagle = Player.new({name: "Beagle Dog", position: "Good Boy", salary: 3_000_001})
      bob = Player.new({name: "Bob McBobby", position: "The Bobster", salary: 1_111_111})
      the_bestfriends = Team.new("The the_bestfriends", "Tim Winner", [shifty, beagle, bob])

      rainbow_cup.add_team(the_beats)
      rainbow_cup.add_team(the_bestfriends)

      expect(rainbow_cup.captains).to eq([rocky, beagle])
    end
  end
  describe "#players_by_team" do
    it "returns a hash with team names as keys and team players as values" do
      rainbow_cup = League.new("Rainbow Cup")

      dwight = Player.new({name: "Dwight Shrute", position: "Midfield", salary: 1_000_000})
      rocky = Player.new({name: "Rocky Malone", position: "Pitcher", salary: 1_502_000})
      richard = Player.new({name: "Richard Doe", position: "Accountant", salary: 43_000})
      the_beats = Team.new("The Beats", "Tim Winner", [dwight, rocky, richard])

      shifty = Player.new({name: "Shifty Doe", position: "Dark Alley", salary: 330_000})
      beagle = Player.new({name: "Beagle Dog", position: "Good Boy", salary: 3_000_001})
      bob = Player.new({name: "Bob McBobby", position: "The Bobster", salary: 1_111_111})
      the_bestfriends = Team.new("The the_bestfriends", "Tim Winner", [shifty, beagle, bob])

      rainbow_cup.add_team(the_beats)
      rainbow_cup.add_team(the_bestfriends)
        expected_hash ={
                        the_beats => ["Dwight Shrute", "Rocky Malone", "Richard Doe"],
                        the_bestfriends => ["Shifty Doe", "Beagle Dog", "Bob McBobby"]
                        }

      expect(rainbow_cup.players_by_team).to eq(expected_hash)
    end
  end
  describe "#most_expensive_player" do
    it "returns the player with the hightest salary from all players" do
      rainbow_cup = League.new("Rainbow Cup")

      dwight = Player.new({name: "Dwight Shrute", position: "Midfield", salary: 1_000_000})
      rocky = Player.new({name: "Rocky Malone", position: "Pitcher", salary: 1_502_000})
      richard = Player.new({name: "Richard Doe", position: "Accountant", salary: 43_000})
      the_beats = Team.new("The Beats", "Tim Winner", [dwight, rocky, richard])

      shifty = Player.new({name: "Shifty Doe", position: "Dark Alley", salary: 330_000})
      beagle = Player.new({name: "Beagle Dog", position: "Good Boy", salary: 3_000_001})
      bob = Player.new({name: "Bob McBobby", position: "The Bobster", salary: 1_111_111})
      the_bestfriends = Team.new("The the_bestfriends", "Tim Winner", [shifty, beagle, bob])

      rainbow_cup.add_team(the_beats)
      rainbow_cup.add_team(the_bestfriends)

      expect(rainbow_cup.most_expensive_player).to eq("Beagle Dog")
    end
  end
  describe "#players_by_salary_range" do
    it "returns a hash of all players keyed to their salary range" do
      rainbow_cup = League.new("Rainbow Cup")

      dwight = Player.new({name: "Dwight Shrute", position: "Midfield", salary: 1_000_000})
      rocky = Player.new({name: "Rocky Malone", position: "Pitcher", salary: 1_502_000})
      richard = Player.new({name: "Richard Doe", position: "Accountant", salary: 43_000})
      the_beats = Team.new("The Beats", "Tim Winner", [dwight, rocky, richard])

      shifty = Player.new({name: "Shifty Doe", position: "Dark Alley", salary: 330_000})
      beagle = Player.new({name: "Beagle Dog", position: "Good Boy", salary: 3_000_001})
      bob = Player.new({name: "Bob McBobby", position: "The Bobster", salary: 1_111_111})
      the_bestfriends = Team.new("The the_bestfriends", "Tim Winner", [shifty, beagle, bob])

      rainbow_cup.add_team(the_beats)
      rainbow_cup.add_team(the_bestfriends)

      expected_hash = {
                        "Over 0M" => ["Richard Doe", "Shifty Doe"],
                        "Over 1M" => ["Dwight Shrute", "Rocky Malone", "Bob McBobby"],
                        "Over 2M" => [],
                        "Over 3M" => ["Beagle Dog"]
                      }

      expect(rainbow_cup.players_by_salary_range).to eq(expected_hash)
    end
  end
end
