require 'spec_helper'
require 'byebug'

describe Ship do

  let(:ship_type) { ShipType.new("Q", 2)}
  let(:ship) {  Ship.new("Vikrant", ship_type, 1, 2, 'A2') }
  let(:ship1) {  Ship.new("Vikrant", ship_type, 1, 2, 'A2') }
  let(:battle_field) { BattleField.new(5, 'E', "Monkey D Luffy") }

  let(:start_row) { 'A' }
  let(:start_col) { 2 } 
  let(:end_row) { "B" }
  let(:end_col) { 2 }
  #let(:battle_field) {}
  
  context "Initialization" do 
  	it "type should be ship_type" do
      expect(ship.type).to eq ship_type
  	end

  	it "start_row should return the correct starting row of ship on battle field" do 
      expect(ship.start_row).to eq start_row
  	end 

  	it "end_row should return the correct ending row of ship on battle field" do 
      expect(ship.end_row).to eq end_row
  	end

  	it "start_col should return the correct starting col of ship on battle field" do 
      expect(ship.start_col).to eq start_col
  	end 
    
    it 'end_col should return the correct ending col of ship on battle field' do 
      expect(ship.end_col).to eq end_col
    end 

    it "cell counts should be zero" do 
      expect(ship.cells.count).to eq 0
    end 
  end 
  
  context "Successfully placed on battle_field" do 
  	before do 
  	  battle_field.place_ship(ship)
  	end
    
    it 'cell counts should be greater than zero' do 
      expect(ship.cells.count).to be > 0
    end
    
    it 'sunk should return false' do 
      expect(ship.sunk?).to eq false
    end
  end

  context "sunk should be true when all cells are detroyed" do
    before do 
      ship.cells = []
    end
    it 'sunk should return true' do 
      expect(ship.sunk?).to eq true
    end
  end
end
