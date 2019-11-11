require 'pry'

class Triangle
attr_accessor :sides, :kind

def initialize(x,y,z)
@sides = [x,y,z]
end

class TriangleError < StandardError
  def message
    "All three sides must be greater than 0 and one side must be greater than the sum of the other two sides"
  end
end

def kind
 #binding.pry
if self.valid?
  self.determine
end
end #end of kind method

def valid?  #triangle inequality test and all sides > 0
  new_array = self.sides.sort
# binding.pry
  if (new_array.find {|side| side <= 0}) || new_array[2] >= new_array[1] + new_array[0]
    raise TriangleError
  else
    return true
  end

true
end #end of method valid?

def determine
    #  :equilateral
    #  :isosceles
    #  :scalene
    #sides are sorted in valid method
#    a_squared = self.sides[0]**2
#    b_squared = self.sides[1]**2
#    c_squared = self.sides[2]**2

  if self.sides[0] == self.sides[1] && self.sides[1] == self.sides[2]
    self.kind = :equilateral
  elsif self.sides[0] == self.sides[1] || self.sides[1] == self.sides[2] || self.sides[0] == self.sides[2]
    self.kind = :isosceles
  else
    self.kind = :scalene
  end #end of if block

end #end of determine method



end #end of class
