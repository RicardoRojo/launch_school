# class robot
class Robot
  attr_accessor :direction
  attr_accessor :position

  def initialize
    
  end

  def orient(direction)
    fail ArgumentError, 'uh, me no compute' if direction == :crood
    @direction = direction
  end

  def bearing
    @direction
  end

  def turn_right
    if direction == :north
      self.direction = :east
    elsif direction == :east
      self.direction = :south
    elsif direction == :south
      self.direction = :west
    elsif direction == :west
      self.direction = :north
    end
  end

  def turn_left
    if direction == :north
      self.direction = :west
    elsif direction == :west
      self.direction = :south
    elsif direction == :south
      self.direction = :east
    elsif direction == :east
      self.direction = :north
    end    
  end

  def advance
    if direction == :north
      position['y'] += 1
    elsif direction == :east
      position['x'] += 1
    elsif direction == :south
      position['y'] -= 1
    elsif direction == :west
      position['x'] -= 1
    end
  end

  def at(x,y)
    @position = {'x' => x, 'y' => y}
  end

  def coordinates
    self.position.values
  end
end

# class simulator
class Simulator
  attr_reader :instruction
  INSTRUCTIONS = {'L' => :turn_left, 'R' => :turn_right, 'A' => :advance}

  def initialize
  end

  def instructions(instructions)
    instruction_array = []
    instructions.chars.each do |instruction|
      instruction_array << INSTRUCTIONS.select {|key,val| key == instruction}.values
    end
    instruction_array.flatten
  end

  def place(robot,options = {})
    robot.at(options[:x],options[:y])
    robot.orient(options[:direction])
  end

  def evaluate(robot,orders)
    inst = self.instructions(orders)

    inst.each do |instruction|
      robot.send(instruction)
    end
  end
end
# robot can turn left or right
# robot can advance
# robot is in a grid facing a direction
  # posible directions are cardinal points (N,S,W,E)
  # coordinates in format {3,5}

  # # 123456789
  #           8
  #           7
  #           6
  #           5
  #           4
  #           3
  #           2
  #           1
  # [x,y] [->,!]
  # if north and moves y += 1
  # elsif west and moves x -= 1
  # elsif east and moves x += 1
  # elsif south and moves y -= 1
      