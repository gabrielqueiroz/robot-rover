class RobotRover
  attr_accessor :coordinates, :direction

  DIRECTIONS = ['North', 'East', 'South', 'West']

  def initialize
    @coordinates = [0, 0]
    @direction   = 0
  end

  def move
    case @direction
    when 0
      @coordinates[1] = @coordinates[1] + 1
    when 1
      @coordinates[0] = @coordinates[0] + 1
    when 2
      @coordinates[1] = @coordinates[1] - 1
    when 3
      @coordinates[0] = @coordinates[0] - 1
    end
  end

  def turn(keyword:)
    if keyword == 'L'
      @direction = @direction - 1
      @direction = 3 if @direction.negative?
    else
      @direction = @direction + 1
      @direction = 0 if @direction == 4
    end
  end

  def report
    "Robot at (#{@coordinates.join(',')}) facing #{DIRECTIONS[@direction]}"
  end
end

if $0 == __FILE__
  robot = RobotRover.new

  message = "Command the robot with:\n"\
    "L - turn left\n"\
    "R - turn right\n"\
    "M - move forward\n"\
    "? - this message\n"\
    "Q - quit"
  puts message

  input = ''

  while input != 'Q'
    input = gets.chomp
    case input
    when 'L'
      robot.turn(keyword: input)
      puts robot.report
    when 'R'
      robot.turn(keyword: input)
      puts robot.report
    when 'M'
      robot.move
      puts robot.report
    when '?'
      puts message
    when 'Q'
      puts 'Goodbye'
    else
      puts '🤖 Sorry, I do not know how to do that'
    end
  end
end
