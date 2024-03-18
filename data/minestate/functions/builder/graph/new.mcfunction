#> minestate:builder/graph/new
#
# Create a new parallel state machine graph
#
# ---
# @context any
# @api
# @macro
#   name: string
#      The name of the graph. Only used in guards and actions.

$data modify storage minestate:builder graph set value {name:"$(name)",graph:{}}