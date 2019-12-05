require "../spec_helper"

describe ConvexHull::Jarvis do
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

    jarvis = ConvexHull::Jarvis.new(points)
    jarvis.convex_hull.should eq(expected)
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

    jarvis = ConvexHull::Jarvis.new(points)
    jarvis.convex_hull.should eq(expected)
  end

  it "should skip colinear from hull" do
    points = [{1, 1}, {2, 2}, {3, 3}, {4, 4}, {4, 8}]

    expected = [
      {1, 1}, {4, 4}, {4, 8},
    ].map { |point| ConvexHull::Point.new(point[0], point[1]) }

    jarvis = ConvexHull::Jarvis.new(points)
    jarvis.convex_hull.should eq(expected)
  end

  it "hull is empty if less then 3 points" do
    points = [{1, 0}, {8, 7}, {7, 6}, {6, 5}]

    expected = [] of ConvexHull::Point

    jarvis = ConvexHull::Jarvis.new(points)
    jarvis.convex_hull.should eq(expected)
  end
end
