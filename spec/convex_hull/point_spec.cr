require "../spec_helper"

class PointWithName < ConvexHull::Point
  getter name

  def initialize(@x, @y, @name : Char)
  end
end

describe ConvexHull::Point do
  context "inheritence" do
    it "convex hull for subclasses of Point" do
      points = [
        PointWithName.new(0, 3, 'A'),
        PointWithName.new(2, 2, 'B'),
        PointWithName.new(1, 1, 'C'),
        PointWithName.new(2, 1, 'D'),
        PointWithName.new(3, 0, 'E'),
        PointWithName.new(0, 0, 'F'),
        PointWithName.new(3, 3, 'G'),
      ]

      graham_scan = ConvexHull::GrahamScan.new(points)
      graham_scan.map(&.as(PointWithName).name).should eq(['A', 'F', 'E', 'G'])
    end
  end
end
