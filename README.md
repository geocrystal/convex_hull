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

## Usage

```crystal
require "convex_hull"

points = [{0, 3}, {2, 2}, {1, 1}, {2, 1}, {3, 0}, {0, 0}, {3, 3}]

graham_scan = ConvexHull::GrahamScan.new(points)
graham_scan.convex_hull.should eq(expected)

jarvis_march = ConvexHull::JarvisMarch.new(points)
jarvis_march.convex_hull.should eq(expected)
```

## Contributing

1. Fork it (<https://github.com/geocrystal/convex_hull/fork>)
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request

## Contributors

- [Anton Maminov](https://github.com/mamantoha) - creator and maintainer
