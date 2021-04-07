require "./lib/player"
require "./lib/team"

RSpec.describe "Team" do
  describe "initialize" do
    it "creates an instance of a team" do
      dwight = Player.new({name: "Dwight Shrute", position: "Midfield", salary: 1_000_000})
      rocky = Player.new({name: "Rocky Malone", position: "Pitcher", salary: 1_502_000})
      richard = Player.new({name: "Richard Doe", position: "Accountant", salary: 43_000})
      team = Team.new("The Beats", "Tim Winner", [dwight, rocky, richard])

      expect(team.class).to eq(Team)
    end
    it "has a name" do
      dwight = Player.new({name: "Dwight Shrute", position: "Midfield", salary: 1_000_000})
      rocky = Player.new({name: "Rocky Malone", position: "Pitcher", salary: 1_502_000})
      richard = Player.new({name: "Richard Doe", position: "Accountant", salary: 43_000})
      team = Team.new("The Beats", "Tim Winner", [dwight, rocky, richard])

      expect(team.name).to eq("The Beats")
    end
    it "has a manager" do
      dwight = Player.new({name: "Dwight Shrute", position: "Midfield", salary: 1_000_000})
      rocky = Player.new({name: "Rocky Malone", position: "Pitcher", salary: 1_502_000})
      team = Team.new("The Beats", "Tim Winner", [dwight, rocky])

      expect(team.coach).to eq("Tim Winner")
    end
    it "has players" do
      dwight = Player.new({name: "Dwight Shrute", position: "Midfield", salary: 1_000_000})
      rocky = Player.new({name: "Rocky Malone", position: "Pitcher", salary: 1_502_000})
      richard = Player.new({name: "Richard Doe", position: "Accountant", salary: 43_000})
      team = Team.new("The Beats", "Tim Winner", [dwight, rocky, richard])

      expect(team.players).to eq([dwight, rocky, richard])
    end
  end
  describe "#total_salary" do
    it "returns the totall salary of all players as an integer withouth underscores" do
      dwight = Player.new({name: "Dwight Shrute", position: "Midfield", salary: 1_000_000})
      rocky = Player.new({name: "Rocky Malone", position: "Pitcher", salary: 1_502_000})
      richard = Player.new({name: "Richard Doe", position: "Accountant", salary: 43_000})
      team = Team.new("The Beats", "Tim Winner", [dwight, rocky, richard])

      expect(team.total_salary).to eq(2545000)
    end
  end
  describe "#captain" do
    it "returns the name of the player with the highest salary" do
      dwight = Player.new({name: "Dwight Shrute", position: "Midfield", salary: 1_000_000})
      rocky = Player.new({name: "Rocky Malone", position: "Pitcher", salary: 1_502_000})
      richard = Player.new({name: "Richard Doe", position: "Accountant", salary: 43_000})
      team = Team.new("The Beats", "Tim Winner", [dwight, rocky, richard])

      expect(team.captain).to eq("Rocky Malone")
    end
  end
  describe "#positions_filled" do
    it "returns an array of all player positions" do
      dwight = Player.new({name: "Dwight Shrute", position: "Midfield", salary: 1_000_000})
      rocky = Player.new({name: "Rocky Malone", position: "Pitcher", salary: 1_502_000})
      richard = Player.new({name: "Richard Doe", position: "Accountant", salary: 43_000})
      team = Team.new("The Beats", "Tim Winner", [dwight, rocky, richard])

      expect(team.positions_filled).to eq(["Midfield", "Pitcher", "Accountant"])
    end
  end

end
