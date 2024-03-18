#> minestate:builder/actions/new
#
# Registers a new action
#
# ---
# @context any
# @api
# @macro
#   name: string
#      The name of the action
#   target: function
#      The action function

$data modify storage minestate:builder actions."$(name)" set value "$(target)"