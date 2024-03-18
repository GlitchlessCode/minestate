#> minestate:builder/finalize
#
# Finalize the creation of a state machine
#
# # Fails
# `E01` Will fail if there are no graphs
#
# `E02` Will fail if there are invalid guards or actions
#
# ---
# @context any
# @api

execute if score $graph_count minestate.internal matches 0 run return run function minestate:builder/graph/private/fail {code: 1}

scoreboard players set $error minestate.internal 0
data modify storage minestate._temp_:internal arr set from storage minestate:builder requests.guards
data modify storage minestate._temp_:internal obj set from storage minestate:builder guards
execute store result storage minestate._temp_:internal len int 1 run data get storage minestate._temp_:internal arr
data modify storage minestate._temp_:internal idx set value 0
scoreboard players set $idx minestate.internal 0
function minestate:builder/private/request_check_loop with storage minestate._temp_:internal
execute unless score $error minestate.internal matches 0 run return fail

scoreboard players set $error minestate.internal 0
data modify storage minestate._temp_:internal arr set from storage minestate:builder requests.actions
data modify storage minestate._temp_:internal obj set from storage minestate:builder actions
execute store result storage minestate._temp_:internal len int 1 run data get storage minestate._temp_:internal arr
data modify storage minestate._temp_:internal idx set value 0
scoreboard players set $idx minestate.internal 0
function minestate:builder/private/request_check_loop with storage minestate._temp_:internal
execute unless score $error minestate.internal matches 0 run return fail

function minestate:builder/private/register_definition with storage minestate:builder builder