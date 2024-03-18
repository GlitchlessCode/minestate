#> minestate:builder/graph/set_initial
#
# Set the initial state of this graph
#
# ---
# @context any
# @api
# @macro
#   target: string
#      The initial target state

$data modify storage minestate:builder graph.initial set value {target:"$(target)"}