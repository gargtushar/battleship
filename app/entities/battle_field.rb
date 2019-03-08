class BattleField
  attr_accessor :cells, :width, :height
  attr_accessor :name 

  def initialize(width, height, player)
    validate_battle_field(width, height)
    self.width = width
    self.height = height
    self.cells = generate_cells(width, height)
    self.name = player
  end 
  
  def place_ship(ship)
    validate_ship(ship)
    (ship.start_row..ship.end_row).each do |r|
      (ship.start_col..ship.end_col).each do |c|
        cell = self.cells["#{r}#{c}"]
        if !cell.place(ship)
          raise "Error! Ship cordinates are overlapping."
        else 
          ship.cells.push(cell) 
        end
      end 
    end 
  end 
  
  def attack(target)
    self.cells[target].hit ? "hit" : "miss"
  end 
  
  private 

    def generate_cells(width, height)
    	cells = {}
      ("A"..height.to_s).each do |l|
        (1..width).each do |n|
          coordinates = "#{l}#{n}"
          cells[coordinates] = Cell.new(l,n) 
        end
      end 
      cells
    end 
    
    def validate_ship(ship) 
      if ship.start_row < "A" || ship.end_row > self.height || ship.start_col < 1 || ship.end_col > self.width
        raise "Wrong Input! Ship can't be placed due to wrong details"
      end       
    end 
    
    def validate_battle_field(width, height)
      if width > 9 || width < 1 
		    raise "Wrong Input! BattleField width should lies between 1 to 9"
		  end

		  if !("A"..'Z').to_a.include? height    
		    raise "Wrong Input! BattleField height should lies between A to Z"
		  end 
    end 
end 