#> minestate:builder/graph/states/transitions/add_target
#
# Add a target to the current transition
#
# ---
# @context any
# @api
# @macro
#   target: string
#      The target state to transition to
#   guards: string[]
#      Array of guards that have to pass to transition. Can be empty.
#   actions: string[]
#      Array of actions to run during the transition. Can be empty.

$data modify storage minestate._temp_:internal guards set value $(guards)
execute store success score $success minestate.internal run data modify storage minestate._temp_:internal guards append value ""
execute if score $success minestate.internal matches 0 run return fail

$data modify storage minestate._temp_:internal actions set value $(actions)
execute store success score $success minestate.internal run data modify storage minestate._temp_:internal actions append value ""
execute if score $success minestate.internal matches 0 run return fail

$data modify storage minestate:builder transition.target append value {target:"$(target)",guards:$(guards),actions:$(actions)}