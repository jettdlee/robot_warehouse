class Warehouse
  MIN_SIZE = 1
  MAX_SIZE = 100
  DEFAULT = 10

  attr_reader :size

  def initialize
    setup_warehouse
  end

  def valid_position?(x, y)
    x.between?(0, @size - 1) && y.between?(0, @size - 1)
  end

  def print_map(robot)
    @size.times do |y|
      row = @size.times.map do |x|
        (robot.x == x && robot.y == y) ? "R": "."
      end
      puts row.join(" ")
    end
  end

  private

  def setup_warehouse
    puts "Set Warehouse size (#{MIN_SIZE}-#{MAX_SIZE}, default: #{DEFAULT})"
    @size = DEFAULT
    loop do
      input = gets.strip
      break if input.empty? 
      if input =~ /^\d+$/ && input.to_i.between?(MIN_SIZE, MAX_SIZE)
        @size = input.to_i
        break
      else
        puts "Invalid input. Enter a number between #{MIN_SIZE} and #{MAX_SIZE}."
      end
    end
  end
end
