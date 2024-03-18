#> minestate:interpreter/private/graphs/load_graph
#
# Load a graph into memory
#
# ---
# @context any
# @within
#   minestate:interpreter/private/graphs/loop
# @macro
#   key: string
#      graph to access

$data modify storage minestate._temp_:internal callstack.frame.graph set from storage minestate._temp_:internal machine.graphs."$(key)"
$data modify storage minestate._temp_:internal action_args.graph set value "$(key)"