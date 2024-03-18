#> minestate:builder/graph/states/private/finalize
#
# Finalize the current state in the current graph
#
# ---
# @context any
# @within minestate:builder/graph/states/finalize
# @macro
#   name: string
#      name of the state

$data modify storage minestate:builder graph.graph."$(name)" set from storage minestate:builder state