#> minestate:interpreter/start
#
# Start a new state machine interpreter using a created definition
#
# # Fails
# Will fail if the target does not exist
#
# ---
# @context any
# @api
# @macro
#   target: string
#      The definition to interpret
#   name: string
#      The name of the interpreter

$execute store success score $success minestate.internal run data get storage minestate:internal definitions.$(target)
execute if score $success minestate.internal matches 0 run return fail

$data modify storage minestate:internal machines.$(name) set from storage minestate:internal definitions.$(target)
$data modify storage minestate:internal machines.$(name).interpreter set value "$(name)"
$data modify storage minestate:internal machines.$(name).locked set value 0b