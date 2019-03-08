require 'singleton'

class Config 
  include Singleton 
  
  attr_accessor :data 

  def initialize
    @data = {
     "ship_types": { 
        "P": 1, 
        "Q": 2, 
      }, 
      "player_counts": 2
    }
  end 
end 
