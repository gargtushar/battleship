require 'spec_helper'

describe Player do 
  
  let(:player) { Player.new("6 E", "Naruto")}
  let(:ship) {  Ship.new("Vikrant", ship_type, 1, 1, 'A2') }
  let(:ship_type) { ShipType.new("Q", 2)}

  context "Creation" do 
    it "should have battlefield object in the battlefield attribute" do 
      expect(player.battle_field.instance_of? BattleField).to eq true
    end 

    it "ship count should be zero" do
      expect(player.ships.count).to eq 0 
    end 
    
    it "missiles count should be zero" do 
      expect(player.missile_count).to eq 0
    end 
  end
  

  context "After getting Input for ships and Missiles " do 
    before do 
      player.ships[ship.name] = ship
      player.missiles = ['A1', 'A2', 'B3']
      player.place_ships
    end   
    
    it "cell count in any ship should be greater than zero" do 
       expect( player.ships[ship.name].cells.count).to be > 0
    end

    it "ship count should greater than zero" do
      expect(player.ships.count).to be > 0
    end 
    
    it "missiles count should greater than zero" do 
      expect(player.missile_count).to be > 0
    end 
  end 
  
  context "remove_sunked_ships" do 
    before do 
      player.ships[ship.name] = ship
      player.ships[ship.name].cells = []
      player.remove_sunked_ships
    end

    it "sunked ship should not exits" do
      expect(player.ships.keys.include? ship.name).to eq false
    end 
  end

  context "After Battle if all ships are destroyed" do 
 
    it "ship count should be zero" do
      expect(player.ships.count).to eq 0 
    end 
    
    it "missiles count should be zero" do 
      expect(player.missile_count).to eq 0
    end
  end 

end 
