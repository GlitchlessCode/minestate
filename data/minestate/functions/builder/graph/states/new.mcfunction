#> minestate:builder/graph/states/new
#
# Create a new state
#
# ---
# @context any
# @api
# @macro
#   name: string
#      The name of the state

$data modify storage minestate:builder state set value {name:"$(name)", transitions:{}, _transitions_:[]}