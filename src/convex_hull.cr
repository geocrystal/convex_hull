require "./convex_hull/point"
require "./convex_hull/algorithm"
require "./convex_hull/graham_scan"
require "./convex_hull/jarvis_march"

module ConvexHull
  VERSION = {{ `shards version #{__DIR__}`.chomp.stringify }}
end
