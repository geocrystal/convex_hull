module ConvexHull
  abstract class Algorithm
    getter points : Array(Point)
    getter convex_hull : Array(ConvexHull::Point)

    def initialize(points : Array(Tuple(Number, Number)))
      raise "There must be at least 3 points" if points.size < 3

      @points = points.uniq.map { |p| Point.new(p[0], p[1]) }.sort
      @convex_hull = compute_convex_hull
    end

    private abstract def compute_convex_hull : Array(ConvexHull::Point)

    def to_a
      @convex_hull.map { |point| {point.x, point.y} }
    end
  end
end
