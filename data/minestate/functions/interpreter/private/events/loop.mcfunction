#> minestate:interpreter/private/events/loop
#
# Traverse all events
#
# ---
# @context any
# @within
#   minestate:interpreter/transition
#   minestate:interpreter/private/events/loop
# @macro
#   idx: int
#      index to access from arr
#   len: int
#      length of arr

$execute if score $idx minestate.internal matches $(len).. run return 1
$data modify storage minestate._temp_:internal event set from storage minestate._temp_:internal callstack.frame.arr[$(idx)]

execute store success score $success minestate.internal run function minestate:interpreter/private/events/event_check with storage minestate._temp_:internal
execute if score $success minestate.internal matches 0 run return run function minestate:interpreter/private/fail {code:3}

data modify storage minestate._temp_:internal action_args.event set from storage minestate._temp_:internal event

#
function minestate:interpreter/private/push

data modify storage minestate._temp_:internal callstack.frame.idx set value 0
data modify storage minestate._temp_:internal callstack.frame.arr set from storage minestate._temp_:internal machine._registry_.graphs
execute store result storage minestate._temp_:internal callstack.frame.len int 1 run data get storage minestate._temp_:internal callstack.frame.arr
scoreboard players set $idx minestate.internal 0
function minestate:interpreter/private/graphs/loop with storage minestate._temp_:internal callstack.frame

function minestate:interpreter/private/pop
#

execute store result score $idx minestate.internal run data get storage minestate._temp_:internal callstack.frame.idx
execute store result storage minestate._temp_:internal callstack.frame.idx int 1 run scoreboard players add $idx minestate.internal 1
function minestate:interpreter/private/events/loop with storage minestate._temp_:internal callstack.frame