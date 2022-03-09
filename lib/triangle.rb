class Triangle
  attr_reader :side_1, :side_2, :side_3

  def initialize(side_1, side_2, side_3)
    @side_1 = side_1
    @side_2 = side_2
    @side_3 = side_3
  end
  
  def kind 
    validate_triangle
    if side_1 == side_2 && side_2 == side_3
      :equilateral
    elsif side_1 == side_2 || side_2 == side_3 || side_3 == side_1
    :isosceles
    else
      :scalene
    end
  end

  def sides_valid? 
    [side_1, side_2, side_3].all?(&:positive?)
  end

  def valid_triangle? 
    side_1 + side_2 > side_3 && side_2 + side_3 > side_1 && side_3 + side_1 > side_2
  end

  def validate_triangle
    raise TriangleError unless sides_valid? && valid_triangle?
  end

  class TriangleError < StandardError
  end

end
