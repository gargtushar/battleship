require 'spec_helper'

describe Battle do 
  let(:player1) { Player.new("6 E", "Naruto") }
  let(:player2) { Player.new("6 E", "Uchiha") }
  let(:p) { ShipType.new("P", 1)}
  let(:battle){ Battle.new(player1, player2)}
  
  before do 
    ("A1".."A6").to_a.each do |i|
      player1.ships[i] = Ship.new(i,p,1,1,i)
    end 
    player1.place_ships
    player1.missiles = ("B1".."B6").to_a
    ("B1".."B6").to_a.each do |i|
      player2.ships[i] = Ship.new(i,p,1,1,i)
    end 
    player2.place_ships
    player2.missiles = ("B1".."B6").to_a
  end 
  
  context "Initialization" do 
    
    it "status should be zero" do 
      expect(battle.status).to eq 0
    end 

    it "winner should be nil" do 
      expect(battle.winner).to eq nil
    end 

    it "result should be 'Game not started'" do 
      expect(battle.result).to eq "Game not started"
    end
  end
  
  context "During Battle" do 
    
    it "should change the turn correctly" do
      p,q = battle.send("change_turn", player1, player2, "miss")
      expect(p).to eq player2
      expect(q).to eq player1
      r, s = battle.send("change_turn", player1, player2, "hit")
      expect(s).to eq player2
      expect(r).to eq player1 
    end
  end 
  
  context "After Battle when someone win" do 
    before do 
      puts "\n Battle Start"
      battle.start
      puts "Battle End"
    end 

    it "status should be 1" do 
      expect(battle.status).to eq 1
    end
    
    it "result should return the winner if anyone wins" do 
      expect(battle.result).to eq "#{player1.name} won the battle"
    end 
  end  

  context "After battle when no one wins" do 
    before do 
    	player1.missiles = ("A1".."A6").to_a
      puts "\n Battle Start"
      battle.start
      puts "Battle End"
    end 
    it "result should be draw" do 
      expect(battle.result).to eq "Games end in Draw"
    end 
  end  
end 