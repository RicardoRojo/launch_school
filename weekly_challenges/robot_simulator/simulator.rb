# class robot
class Robot
  attr_accessor :direction
  attr_accessor :position
  DIRECTIONS = [:north, :east, :south, :west]

  def initialize; end

  def orient(direction)
    fail ArgumentError, 'uh, me no compute' if direction == :crood
    @direction = direction
  end

  def bearing
    direction
  end

  def turn_right
    self.direction = DIRECTIONS[(DIRECTIONS.find_index(direction) + 1) % 4]
  end

  def turn_left
    self.direction = DIRECTIONS[(DIRECTIONS.find_index(direction) - 1) % 4]
  end

  def advance
    case direction
    when :north
      position['y'] += 1
    when :south
      position['y'] -= 1
    when :east
      position['x'] += 1
    when :west
      position['x'] -= 1
    end
  end

  def at(x, y)
    @position = { 'x' => x, 'y' => y }
  end

  def coordinates
    position.values
  end
end

# class simulator
class Simulator
  INSTRUCTIONS = { 'L' => :turn_left, 'R' => :turn_right, 'A' => :advance }

  def initialize; end

  def instructions(instructions)
    instructions.chars.inject([]) { |a, e| a + get_instruction(e) }
  end

  def get_instruction(instruction)
    INSTRUCTIONS.select { |key, _| key == instruction }.values
  end

  def place(robot, options = {})
    robot.at(options[:x], options[:y])
    robot.orient(options[:direction])
  end

  def evaluate(robot, orders)
    instructions(orders).each do |instruction|
      robot.send(instruction)
    end
  end
end
