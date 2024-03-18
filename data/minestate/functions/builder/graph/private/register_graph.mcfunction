#> minestate:builder/graph/private/register_graph
#
# Register a graph
#
# ---
# @context any
# @within minestate:builder/graph/finalize
# @macro
#   name: string
#      name of the graph to register
#

$data modify storage minestate:builder builder.graphs."$(name)" set from storage minestate._temp_:internal built_graph
$execute unless score $exists minestate.internal matches 1 run data modify storage minestate:builder builder._registry_.graphs append value "$(name)"