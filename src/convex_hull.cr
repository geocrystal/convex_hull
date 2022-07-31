require "./convex_hull/*"

module ConvexHull
  VERSION = {{ `shards version #{__DIR__}`.chomp.stringify }}

  alias Number = Int32 | Float32 | Float64
end
