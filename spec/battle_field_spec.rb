require 'spec_helper'

describe BattleField do
 
  let(:ship_type) { ShipType.new("Q", 2)}
  let(:ship) {  Ship.new("Vikrant", ship_type, 1, 1, 'A2') }
  let(:ship1) {  Ship.new("Vikrant", ship_type, 1, 1, 'A2') }
  let(:ship3) { Ship.new("Vikant", ship_type, 1, 6, "A3")}
  let(:battle_field) { BattleField.new(5, 'E', "Monkey D Luffy") }

  context 'Initialization' do  
    it "should not create battlefield for wrong cordinates" do 
      expect(lambda{BattleField.new(10, 'A', "Monkey D Luffy")}).to raise_error("Wrong Input! BattleField width should lies between 1 to 9")
      expect(lambda{BattleField.new(8, 'AZ', "Monkey D Luffy")}).to raise_error("Wrong Input! BattleField height should lies between A to Z")
    end 

    it "attack should return miss as all cells have water " do 
      expect(battle_field.attack("B2")).to eq "miss"
    end 
  end 
  
  context "Place Ships" do 
    before do 
      battle_field.place_ship(ship)
    end
    it "ships should not overlap" do 
      expect(lambda{battle_field.place_ship(ship1)}).to raise_error("Error! Ship cordinates are overlapping.")
    end 

    it "attack should return hit if there is ship on the specific cell" do
      expect(battle_field.attack("A2")).to eq "hit"
    end 
    
    it "attack should return miss target cell have water " do 
      expect(battle_field.attack("B2")).to eq "miss"
    end

    it "should not place ship which exceeds battlefield boundaries" do 
      expect(lambda{battle_field.place_ship(ship3)}).to raise_error("Wrong Input! Ship can't be placed due to wrong details")
    end

  end 
 
end   

