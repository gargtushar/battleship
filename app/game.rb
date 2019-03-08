class Game 
  attr_accessor  :players, :ship_types

  def initialize
    self.ship_types = {}
    self.players = {}
    Config.instance.data[:ship_types].each do |k, v|
      self.ship_types[k] = ShipType.new(k.to_s, v)
    end 
    set_game 
  end 
  
  def start
    candiates = players.keys.first(2)
    p1 = players[candiates.first]
    p2 = players[candiates.last]
    battle = Battle.new(p1,p2)
    battle.start 
    puts battle.result
  end  

  private 

    def set_game 
      battle_field_cordinates = gets.strip
      # Create Player and Set Battlefields
      (1..Config.instance.data[:player_counts]).each do |i|
        self.players["Player#{i}"] = Player.new(battle_field_cordinates, "Player#{i}")
      end 
      # get ships count and thier details
      battle_ship_numbers = gets.to_i 
      (1..battle_ship_numbers).each do |i|
        ship_detail = gets.strip.split(" ")
        process_ship(ship_detail, "Ship#{i}")
      end 
      # Place ships on the player's battefields and get missiles for all
      self.players.values.each do |player|
        player.place_ships
        player.missiles = gets.strip.split(" ")
      end 
    end 

    def process_ship(ship_detail, name)	
      # Assign ships to all players on the basis of ship details 
      type = self.ship_types[ship_detail.shift.to_sym]
      width = ship_detail.shift.to_i
      height = ship_detail.shift.to_i
      self.players.each do |n, player|
        ship = Ship.new(name, type, width, height, ship_detail.shift)
        player.ships[ship.name] = ship 
      end 
    end 
end