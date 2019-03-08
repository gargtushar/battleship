class Cell 
  
  attr_accessor :name, :row, :column, :strength, :content

  def initialize(row, column )
    self.row = row 
    self.column = column
    self.content = "water"
    self.strength = -1
    self.name = "#{row}#{column}"
  end
  
  def place(ship)
    return false if self.content != "water"
    self.content = ship
    self.strength = ship.type.strength
    return true
  end 

  def hit
    if self.content == "water" || self.strength <= 0 
      return false 
    else 
      self.strength -= 1                         # if cell is sunked the replace it's contents to water
      if self.strength == 0 
        self.content.cells.delete(self)
        self.content = "water"
      end 
      return true
    end 
  end
  

end 