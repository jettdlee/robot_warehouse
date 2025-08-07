require_relative 'warehouse'
class Robot
  attr_reader :x, :y
  COMMANDS = %w[N E S W]

  def initialize(warehouse: Warehouse.new)
    @warehouse = warehouse
    setup_robot
  end

  def position
    puts "Position: #{@x}, #{@y}"
  end

  def move(command)
    unless COMMANDS.include?(command)
      puts "Invalid Command: #{command}"
      return
    end

    new_x, new_y = @x.dup, @y.dup
    case command
    when "N" then new_y -= 1
    when "E" then new_x += 1
    when "S" then new_y += 1
    when "W" then new_x -= 1
    else
      puts "Invalid direction: #{command}"
    end

    if @warehouse.valid_position?(new_x, new_y)
      @x, @y = new_x, new_y
      position()
    else
      puts "Cannot move from (#{@x}, #{@y})"
    end
  end

  def setup_robot
    puts "Set start position (0-#{@warehouse.size - 1}), format: x,y (default: 0,0):"
    robot_position = [0, 0]

    loop do
      input = gets.strip
      break if input.empty?
      inputs = input.split(",").map(&:strip)
      if inputs.size == 2 && inputs.all? { |v| v =~ /^\d+$/ }
        x, y = inputs.map(&:to_i)
        if x.between?(0, @warehouse.size - 1) && y.between?(0, @warehouse.size - 1)
          robot_position = [x, y]
          break
        else
          puts "Coordinates must be within 0 to #{@warehouse.size - 1}"
        end
      else
        puts "Invalid Input"
      end
    end
    @x, @y = robot_position
  end
end
