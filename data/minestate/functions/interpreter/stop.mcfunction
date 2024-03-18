#> minestate:interpreter/stop
#
# Stop an interpreter
#
# # Fails
# Will fail if the target does not exist
#
# ---
# @context any
# @api
# @macro
#   target: string
#      Target interpreter to stop

$execute store success score $success minestate.internal run data get storage minestate:internal machines.$(target)
execute if score $success minestate.internal matches 0 run return fail

$data remove storage minestate:internal machines.$(target)