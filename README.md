# ConvexHull

![Crystal CI](https://github.com/geocrystal/convex_hull/workflows/Crystal%20CI/badge.svg)
[![GitHub release](https://img.shields.io/github/release/geocrystal/convex_hull.svg)](https://github.com/geocrystal/convex_hull/releases)
[![License](https://img.shields.io/github/license/geocrystal/convex_hull.svg)](https://github.com/geocrystal/convex_hull/blob/master/LICENSE)

Crystal implementation of finding the convex hull of a finite set of points in the plane.

Supported algorithms:

- [Jarvis march](https://en.wikipedia.org/wiki/Gift_wrapping_algorithm)
- [Graham scan](https://en.wikipedia.org/wiki/Graham_scan)

## Installation

1. Add the dependency to your `shard.yml`:

   ```yaml
   dependencies:
     convex_hull:
       github: geocrystal/convex_hull
   ```

2. Run `shards install`

## Computing a Convex Hull

Given X, a set of points in 2-D, the convex hull is the minimum set of points that define a polygon containing all the points of X. If you imagine the points as pegs on a board, you can find the convex hull by surrounding the pegs by a loop of string and then tightening the string until there is no more slack.

The following is an example of a convex hull of 19 points.

![convex hull](/assets/convex.png)

### Instantiate algorithm

This library supports `ConvexHull::GrahamScan` and `ConvexHull::JarvisMarch` inherided from abstract class `ConvexHull::Algorithm`.

It accepts `Array` of one of these:

- `Tuple(Number, Number)`
- `ConvexHull::Point`
- Sub-class of `ConvexHull::Point`

And return `Array` of `ConvexHull::Point`.

```crystal
require "convex_hull"

points = [
  {-10, 3}, {-10, 4}, {-7, 8}, {-7, 2}, {-3, 4},
  {-2, 2}, {7, 3}, {9, 5}, {9, -7}, {5, -10},
  {7, -8}, {5, -4}, {5, -5}, {4, -6}, {2, -7},
  {1, -8}, {-3, -4}, {-4, -6}, {-9, -5},
]

# or
#
# points = [
#   ConvexHull::Point.new(-10, 3),
#   ConvexHull::Point.new(-10, 4),
# ...
# ]

```

### Convex hull

#### Jarvis march


```crystal
graham_scan = ConvexHull::GrahamScan.new(points)
graham_scan.map { |point| {point.x, point.y} }
# => [{-10, 4}, {-10, 3}, {-9, -5}, {5, -10}, {9, -7}, {9, 5}, {-7, 8}]
```

#### Graham scan

```crystal
jarvis_march = ConvexHull::JarvisMarch.new(points)
jarvis_march.map { |point| {point.x, point.y} }
# => [{-10, 4}, {-10, 3}, {-9, -5}, {5, -10}, {9, -7}, {9, 5}, {-7, 8}]
```

The result is an ordered collection of objects of type `ConvexHull::Point`.

## Contributing

1. Fork it (<https://github.com/geocrystal/convex_hull/fork>)
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request

## Contributors

- [Anton Maminov](https://github.com/mamantoha) - creator and maintainer
