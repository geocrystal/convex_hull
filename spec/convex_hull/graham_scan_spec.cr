require "../spec_helper"

describe ConvexHull::GrahamScan do
  it "integers" do
    points = [
      {0, 3},
      {2, 2},
      {1, 1},
      {2, 1},
      {3, 0},
      {0, 0},
      {3, 3},
    ]

    expected = [
      {0, 3}, {0, 0}, {3, 0}, {3, 3},
    ].map { |point| ConvexHull::Point.new(point[0], point[1]) }

    graham_scan = ConvexHull::GrahamScan.new(points)
    graham_scan.convex_hull.should eq(expected)
  end

  it "floats" do
    points = [
      {0.0, 3.0},
      {2.0, 2.0},
      {1.0, 1.0},
      {2.0, 1.0},
      {3.0, 0.0},
      {0.0, 0.0},
      {3.0, 3.0},
    ]

    expected = [
      {0.0, 3.0}, {0.0, 0.0}, {3.0, 0.0}, {3.0, 3.0},
    ].map { |point| ConvexHull::Point.new(point[0], point[1]) }

    graham_scan = ConvexHull::GrahamScan.new(points)
    graham_scan.convex_hull.should eq(expected)
  end
end
