require 'spec_helper'

describe Cell do

  let(:cell) { Cell.new('B', 2)}
  let(:ship_type) { ShipType.new("Q", 2)}
  let(:ship1) { Ship.new("Shakti", ship_type, 2, 2, "B2")}
  let(:ship2) { Ship.new("Vikrant", ship_type, 1, 2, "A2")}

  context "Initialization" do 
  	it "content should be water" do
      expect(cell.content).to eq "water"
  	end

  	it "strength should be -1" do 
      expect(cell.strength).to eq -1
  	end 

    it "name should be concatenation of row and column" do 
      expect(cell.name).to eq 'B2'
    end 
  end 

  context "Ship Placement" do   
    it "can place only one ship" do 
      expect(cell.place(ship1)).to eq true
      expect(cell.place(ship2)).to eq false
    end   	
    
    it "strength should be equal strength of shiptype of ship" do 
      cell.place(ship1)
      expect(cell.strength).to eq ship1.type.strength
    end 
  end 

  context "While battle when cell content is water" do 
    it "should return false" do 
      expect(cell.hit).to eq false
    end 
  end 
  
  context "while battle cell content is Ship" do 
    before do 
      cell.place(ship1)
    end 

    it "should return true" do 
      expect(cell.hit).to eq true
    end 
  
    it "should return false when number of hits exceed more than strength" do 
      cell.hit
      cell.hit
      expect(cell.hit).to eq false
      expect(cell.content).to eq "water"
    end
  end 
end 