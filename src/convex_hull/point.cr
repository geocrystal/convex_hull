module ConvexHull
  struct Point
    include Comparable(self)

    getter :x
    getter :y

    def initialize(@x : Number, @y : Number)
    end

    def <=>(other : Point)
      if self.x > other.x
        1
      elsif self.x == other.x
        if self.y < other.y
          1
        elsif self.y == other.y
          0
        else
          -1
        end
      else
        -1
      end
    end
  end
end
