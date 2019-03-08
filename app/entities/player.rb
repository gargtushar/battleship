class Player 
  attr_accessor :battle_field, :missiles, :name, :ships
  
  def initialize(bfc,name)
  	self.name = name
  	bfc = bfc.split(" ")
    self.battle_field = BattleField.new(bfc.first.to_i, bfc.last, self.name)
    self.ships = {}
    self.missiles = []
  end 
  
  def place_ships 
    self.ships.values.each do |v|
      self.battle_field.place_ship(v)
    end 
  end 
  
  def remove_sunked_ships
    self.ships.keep_if {|name,ship| !ship.sunk? }
  end 
  
  def missile_count 
    self.missiles.count
  end 

  def target
    self.missiles.shift
  end 
end 