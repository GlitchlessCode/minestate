#> minestate:builder/guards/new
#
# Registers a new guard
#
# ---
# @context any
# @api
# @macro
#   name: string
#      The name of the guard
#   target: function
#      The guard function. Needs to return a value.

$data modify storage minestate:builder guards."$(name)" set value "$(target)"