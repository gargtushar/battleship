class Battle  
  attr_accessor :turn, :opponent, :winner, :status
  def initialize(turn, opponent)
    self.turn = turn 
    self.opponent = opponent
    self.status = 0
  end 
  

  def start 
  	turn = self.turn
  	opponent = self.opponent
    self.status = 1
    while (turn.missile_count + opponent.missile_count) > 0 && turn.ships.count > 0 && opponent.ships.count do 
      target = turn.target
      if target.nil?
        puts "#{turn.name} have no missile left to launch" 
        turn, opponent = change_turn(turn, opponent, "miss")
      else 
        print "#{turn.name} fire a missile with target #{target} "
        score = opponent.battle_field.attack(target)
        puts "which got #{score}"
        sunk(opponent)
        turn, opponent = change_turn(turn,opponent,score)
      end 
      set_result
    end
  end
  
  def result 
    if status == 1
      winner ? "#{winner.name} won the battle" : "Games end in Draw" 
    else 
      return "Game not started"
    end 
  end 

  private 
    
    def set_result 
      if self.turn.ships.count == 0
        self.winner = self.opponent
      elsif self.opponent.ships.count == 0 
        self.winner = turn 
      end      
    end

    def change_turn(turn, opponent, score)
      score == "miss" ? (return opponent,turn) : (return turn, opponent)
    end

    def sunk(player)
      player.remove_sunked_ships
    end
end 

    
    
    
    

   