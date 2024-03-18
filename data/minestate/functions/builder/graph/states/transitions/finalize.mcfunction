#> minestate:builder/graph/states/transitions/finalize
#
# Finalize the current transition
#
# # Fails
# Will fail if there are no targets
#
# ---
# @context any
# @api

execute store result score $len minestate.internal run data get storage minestate:builder transition.target
execute if score $len minestate.internal matches 0 run return fail

function minestate:builder/graph/states/transitions/private/finalize with storage minestate:builder transition