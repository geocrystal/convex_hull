module ConvexHull
  class GrahamScan < Algorithm
    private def convex_hull(points) : Array(Point)
      lower = Array(Point).new

      points.each do |point|
        while lower.size > 1 && cross(lower[-2], lower[-1], point) <= 0
          lower.pop
        end

        lower.push(point)
      end

      upper = Array(Point).new

      points.reverse_each do |point|
        while upper.size > 1 && cross(upper[-2], upper[-1], point) <= 0
          upper.pop
        end

        upper.push(point)
      end

      hull = lower[...-1] + upper[...-1]

      return [] of Point if hull.size < 3

      hull
    end

    private def cross(p : Point, q : Point, r : Point)
      (q.x - p.x) * (r.y - p.y) - (q.y - p.y) * (r.x - p.x)
    end
  end
end
