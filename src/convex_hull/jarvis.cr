module ConvexHull
  class Jarvis
    getter points : Array(Point)

    def initialize(points : Array(Tuple(Int32, Int32)))
      raise "There must be at least 3 points" if points.size < 3

      @points = points.map { |p| Point.new(p[0], p[1]) }
    end

    def convex_hull
      n = @points.size

      hull = [] of Point

      l = left_index

      # Start from leftmost point, keep moving counterclockwise
      # until reach the start point again. This loop runs O(h)
      # times where h is number of points in result or output.
      p = l
      q = 0

      loop do
        # Add current point to result
        hull << @points[p]

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

      hull
    end

    # Finding the left most point
    def left_index
      minn = 0

      1.upto(@points.size - 1) do |i|
        if points[i].x < points[minn].x
          minn = i
        elsif points[i].x == points[minn].x
          if points[i].y > points[minn].y
            minn = i
          end
        end
      end

      minn
    end

    def orientation(p : Point, q : Point, r : Point)
      val = (q.y - p.y) * (r.x - q.x) -
            (q.x - p.x) * (r.y - q.y)

      return 0 if val == 0 # colinear
      val > 0 ? 1 : 2      # clockwise or counterclockwise
    end
  end
end
