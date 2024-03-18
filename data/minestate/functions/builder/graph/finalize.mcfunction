#> minestate:builder/graph/finalize
#
# Finalize the current state machine graph
#
# Simplifies the graph
#
# # Fails
#
# `E01` Will fail if the graph has no states
#
# `E02` Will fail if the graph has no initial state
#
# `E03` Will fail if the graph is invalid
#
# ---
# @context any
# @api

execute store result score $count minestate.internal run data get storage minestate:builder graph.graph
execute if score $count minestate.internal matches 0 run return run function minestate:builder/graph/private/fail {code: 1}

execute unless data storage minestate:builder graph.initial run return run function minestate:builder/graph/private/fail {code: 2}

scoreboard players set $error minestate.internal 0
data modify storage minestate._temp_:internal traversed set value {}
data modify storage minestate._temp_:internal events set value {}
data modify storage minestate._temp_:internal graph set value {}
data modify storage minestate._temp_:internal callstack set value {stack:[],frame:{}}
function minestate:builder/graph/private/traverse with storage minestate:builder graph.initial
execute unless score $error minestate.internal matches 0 run return fail

data modify storage minestate._temp_:internal built_graph set value {}
data modify storage minestate._temp_:internal built_graph.name set from storage minestate:builder graph.name
data modify storage minestate._temp_:internal built_graph.states set from storage minestate._temp_:internal graph 
function minestate:builder/graph/private/set_init with storage minestate:builder graph.initial

data modify storage minestate:builder builder._registry_.events merge from storage minestate._temp_:internal events

execute store result score $exists minestate.internal run function minestate:builder/graph/private/graph_check with storage minestate:builder graph
execute unless score $exists minestate.internal matches 1 store result storage minestate:builder builder.graph_count int 1 run scoreboard players add $graph_count minestate.internal 1

function minestate:builder/graph/private/register_graph with storage minestate:builder graph