require "../spec_helper"

describe ConvexHull::GrahamScan do
  it "works" do
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

    jarvis = ConvexHull::GrahamScan.new(points)
    jarvis.convex_hull.should eq(expected)
  end
end
