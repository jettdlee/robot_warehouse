require_relative 'warehouse'
require_relative 'robot'

def help()
  puts "Command:"
  puts "* 'N,E,S,W' to move robot"
  puts "* a sequence of directions separated by commas can be used"
  puts "* type 'map' to see warehouse"
  puts "* type 'help' to see instructions"
  puts "* type 'exit' to quit"
end

warehouse = Warehouse.new
robot = Robot.new(warehouse: warehouse)

help()

loop do
  print "\n Enter command:"
  input = gets.strip.upcase
  break if input == "EXIT"

  if input == "MAP"
    warehouse.print_map(robot)
  elsif input == "HELP"
    help
  else
    input.split(",").map(&:strip).each do |command|
      robot.move(command)
    end
  end
end

