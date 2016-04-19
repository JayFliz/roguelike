class Coordinate
  def initialize(x, y)
    @x, @y = x, y
  end

  attr_reader :x, :y

  def eql?(object)
    object.x == x && object.y == y
  end

  def hash
    [x, y].hash
  end

  def up
    Coordinate.new(x, y-1)
  end

  def down
    Coordinate.new(x, y+1)
  end

  def left
    Coordinate.new(x-1, y)
  end

  def right
    Coordinate.new(x+1, y)
  end

  def adjacent?(coord)
    [:up, :down, :left, :right].each do |direction|
      return true if self.send(direction).eql?(coord)
    end
    false
  end

  def above?(coord)
    self.y < coord.y
  end

  def below?(coord)
    self.y > coord.y
  end

  def left_of?(coord)
    self.x < coord.x
  end

  def right_of?(coord)
    self.x > coord.x
  end

  def direction_to_chase(coord)
    chase_directions = {:above? => :down, :below? => :up, :left_of? => :right, :right_of? => :left}
    [:above?, :below?, :left_of?, :right_of?].each do |relation|
      return chase_directions[relation] if self.send(relation, coord)
    end
    false
  end
end
