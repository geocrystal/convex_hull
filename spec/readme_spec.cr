require "./spec_helper"

describe ConvexHull::GrahamScan do
  context "readme" do
    it "works" do
      points = [
        {-10, 3},
        {-10, 4},
        {-7, 8},
        {-7, 2},
        {-3, 4},
        {-2, 2},
        {7, 3},
        {9, 5},
        {9, -7},
        {5, -10},
        {7, -8},
        {5, -4},
        {5, -5},
        {4, -6},
        {2, -7},
        {1, -8},
        {-3, -4},
        {-4, -6},
        {-9, -5},
      ]

      hull = [
        {-10, 4},
        {-10, 3},
        {-9, -5},
        {5, -10},
        {9, -7},
        {9, 5},
        {-7, 8},
      ]

      expected = hull.map { |point| ConvexHull::Point.new(point[0], point[1]) }

      graham_scan = ConvexHull::GrahamScan.new(points)
      graham_scan.map { |point| {point.x, point.y} }.should eq(hull)
      graham_scan.to_a.should eq(expected)

      jarvis = ConvexHull::JarvisMarch.new(points)
      jarvis.map { |point| {point.x, point.y} }.should eq(hull)
      jarvis.to_a.should eq(expected)
    end
  end
end
