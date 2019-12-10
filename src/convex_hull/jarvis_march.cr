module ConvexHull
  class JarvisMarch
    getter points : Array(Point)

    def initialize(points : Array(Tuple(Number, Number)))
      raise "There must be at least 3 points" if points.size < 3

      @points = points.uniq.map { |p| Point.new(p[0], p[1]) }.sort
    end

    def convex_hull
      n = @points.size

      hull = [] of Point

      # Start from leftmost point, keep moving counterclockwise
      # until reach the start point again. This loop runs O(h)
      # times where h is number of points in result or output.
      l = p = q = 0

      loop do
        point = @points[p]

        if hull.size > 1 && orientation(hull[-2], hull[-1], point) == 0
          hull.pop
        end

        # Add current point to result
        hull << point

        # Search for a point 'q' such that orientation(p, x, q) is counterclockwise
        # for all points 'x'.
        # The idea is to keep track of last visited most counterclock-wise point in q.
        # If any point 'i' is more counterclock-wise than q, then update q.
        q = (p + 1) % n

        n.times do |i|
          # If i is more counterclockwise than current q, then update q
          if orientation(points[p], points[i], points[q]) == 2
            q = i
          end
        end

        # Now q is the most counterclockwise with respect to p.
        # Set p as q for next iteration, so that q is added to result 'hull'
        p = q

        # While we don't come to first point
        break if p == l
      end

      return [] of Point if hull.size < 3
      hull
    end

    def orientation(p : Point, q : Point, r : Point)
      val = (q.y - p.y) * (r.x - q.x) -
            (q.x - p.x) * (r.y - q.y)

      return 0 if val == 0 # colinear
      val > 0 ? 1 : 2      # clockwise or counterclockwise
    end
  end
end
