#> minestate:builder/graph/private/traverse
#
# Traverse a state node
#
# ---
# @context any
# @within
#   minestate:builder/graph/finalize
#   minestate:builder/graph/private/target_loop
# @macro
#   target: string
#      name of the state node to traverse

$execute unless data storage minestate:builder graph.graph."$(target)" run return run function minestate:builder/graph/private/fail {code: 3}

$data modify storage minestate._temp_:internal graph."$(target)" set from storage minestate:builder graph.graph."$(target)"
$data remove storage minestate._temp_:internal graph."$(target)"._transitions_

$data modify storage minestate._temp_:internal traversed."$(target)" set value 1b

function minestate:builder/graph/private/push

data modify storage minestate._temp_:internal callstack.frame.idx set value 0
$data modify storage minestate._temp_:internal callstack.frame.arr set from storage minestate:builder graph.graph."$(target)"._transitions_
$data modify storage minestate._temp_:internal callstack.frame.transitions set from storage minestate:builder graph.graph."$(target)".transitions
execute store result storage minestate._temp_:internal callstack.frame.len int 1 run data get storage minestate._temp_:internal callstack.frame.arr
scoreboard players set $idx minestate.internal 0
function minestate:builder/graph/private/transition_loop with storage minestate._temp_:internal callstack.frame

function minestate:builder/graph/private/pop