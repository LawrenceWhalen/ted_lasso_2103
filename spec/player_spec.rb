require "./lib/player"

RSpec.describe "Player" do
  describe "#initialize" do
    it "creates an instance of a player" do
      player = Player.new({name: "Dwight Shrute", position: "Manager", salary: 1_000_000})

      expect(player.class).to eq(Player)
    end
    it "has a name" do
      player = Player.new({name: "Dwight Shrute", position: "Manager", salary: 1_000_000})

      expect(player.name).to eq("Dwight Shrute")
    end
    it "has a position" do
      player = Player.new({name: "Dwight Shrute", position: "Manager", salary: 1_000_000})

      expect(player.position).to eq("Manager")
    end
    it "has a salary" do
      player = Player.new({name: "Dwight Shrute", position: "Manager", salary: 1_000_000})

      expect(player.salary).to eq(1_000_000)
    end
  end
end
