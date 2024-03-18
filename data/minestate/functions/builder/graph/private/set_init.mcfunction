#> minestate:builder/graph/private/set_init
#
# Set the initial graph state of `built_graph`
#
# ---
# @context any
# @within minestate:builder/graph/finalize
# @macro
#   target: string
#      name of the state to set

$data modify storage minestate._temp_:internal built_graph.current set from storage minestate._temp_:internal graph.$(target)