module ConvexHull
  class Point
    include Comparable(self)

    getter :x
    getter :y

    def initialize(@x : Int32 | Float32 | Float64, @y : Int32 | Float32 | Float64)
    end

    def <=>(other : Point)
      compare_x(other)
    end

    private def compare_x(other)
      if self.x > other.x
        1
      elsif self.x == other.x
        compare_y(other)
      else
        -1
      end
    end

    private def compare_y(other)
      if self.y < other.y
        1
      elsif self.y == other.y
        0
      else
        -1
      end
    end
  end
end
