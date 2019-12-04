module ConvexHull
  class GrahamScan
    getter points : Array(Point)

    def initialize(points : Array(Tuple(Int32, Int32)))
      raise "There must be at least 3 points" if points.size < 3

      @points = points.uniq.map { |p| Point.new(p[0], p[1]) }
    end

    def convex_hull
      points.sort! do |a, b|
        if a.x > b.x
          1
        elsif a.x == b.x
          if a.y < b.y
            1
          elsif a.y == b.y
            0
          else
            -1
          end
        else
          -1
        end
      end

      return points if points.size <= 3

      lower = Array(Point).new

      points.each do |p|
        while lower.size > 1 && cross(lower[-2], lower[-1], p) <= 0
          lower.pop
        end
        lower.push(p)
      end

      upper = Array(Point).new
      points.reverse_each do |p|
        while upper.size > 1 && cross(upper[-2], upper[-1], p) <= 0
          upper.pop
        end
        upper.push(p)
      end

      lower[0...-1] + upper[0...-1]
    end

    private def cross(p : Point, q : Point, r : Point)
      (q.x - p.x) * (r.y - p.y) - (q.y - p.y) * (r.x - p.x)
    end
  end
end
