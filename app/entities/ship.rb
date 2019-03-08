class Ship 
  attr_accessor :name, :type, :width, :height, :coordinates, :cells 
  
  def initialize(name, type, width, height, coordinates)
    self.name = name
    self.type = type 
    self.width = width 
    self.height = height 
    self.coordinates = coordinates
    self.cells = []
  end 
  
  def sunk? 
    self.cells.count == 0 
  end 

  def start_row
    self.coordinates.split('').first
  end
  
  def end_row 
    end_row = (start_row.codepoints.first + (self.height - 1)).chr
  end 
  
  def start_col
    self.coordinates.split('').last.to_i
  end

  def end_col
    end_col = start_col + self.width - 1
  end

end 