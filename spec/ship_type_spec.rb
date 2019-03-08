require 'spec_helper'

describe ShipType do
  let(:name) { "B" }
  let(:strength) { 2} 

  let(:ship_type) { ShipType.new(name, strength)}

  context "Initialization" do 
    it "name and strength should be correct" do 
       expect(ship_type.name).to eq name
       expect(ship_type.strength).to eq strength
    end 
  end 

end 