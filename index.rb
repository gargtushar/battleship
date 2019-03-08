require 'active_support'
require 'byebug'
ActiveSupport::Dependencies.autoload_paths = [
  'app/',
  'app/entities',
  'config/'
]
begin
  obj = Game.new
  obj.start
rescue => e 
  puts e.message
  return false
end 