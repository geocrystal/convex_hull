require "./convex_hull/point"
require "./convex_hull/jarvis_march"
require "./convex_hull/graham_scan"

module ConvexHull
  VERSION = {{ `shards version #{__DIR__}`.chomp.stringify }}

  alias Number = Int32 | Float32 | Float64
end
