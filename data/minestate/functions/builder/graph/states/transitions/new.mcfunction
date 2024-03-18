#> minestate:builder/graph/states/transitions/new
#
# Create a new transition in the current state
#
# ---
# @context any
# @api
# @macro
#   name: string
#      The name of the transition

$data modify storage minestate:builder transition set value {name:"$(name)", target:[]}