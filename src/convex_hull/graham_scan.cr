module ConvexHull
  class GrahamScan
    getter points : Array(Point)

    def initialize(points : Array(Tuple(Number, Number)))
      raise "There must be at least 3 points" if points.size < 3

      @points = points.uniq.map { |p| Point.new(p[0], p[1]) }.sort
    end

    def convex_hull
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

      hull = lower[0...-1] + upper[0...-1]
      return [] of Point if hull.size < 3
      hull
    end

    private def cross(p : Point, q : Point, r : Point)
      (q.x - p.x) * (r.y - p.y) - (q.y - p.y) * (r.x - p.x)
    end
  end
end
