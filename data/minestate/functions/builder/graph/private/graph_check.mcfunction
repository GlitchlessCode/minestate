#> minestate:builder/graph/private/graph_check
#
# Check graph exists already
#
# ---
# @context any
# @within minestate:builder/graph/finalize
# @macro
#   name: string
#      The graph to check for

$return run execute if data storage minestate:builder builder.graphs."$(name)"