module ConvexHull
  abstract class Algorithm
    include Enumerable(Point)
    include Iterable(Point)

    @convex_hull : Array(Point)

    def initialize(points : Array(Tuple(Int32 | Float32 | Float64, Int32 | Float32 | Float64)))
      raise "There must be at least 3 points" if points.size < 3

      points = points.uniq.map { |point| Point.new(point[0], point[1]) }.sort!

      @convex_hull = convex_hull(points)
    end

    def initialize(points : Array(Point))
      raise "There must be at least 3 points" if points.size < 3

      points = points.sort

      @convex_hull = convex_hull(points)
    end

    private abstract def convex_hull(points) : Array(Point)

    def each(& : Point ->) : Nil
      @convex_hull.each do |point|
        yield point
      end
    end

    def each
      EntryIterator(Point).new(self)
    end
  end
end
