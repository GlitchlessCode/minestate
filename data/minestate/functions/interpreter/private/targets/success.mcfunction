#> minestate:interpreter/private/targets/success
#
# Successfully resolve a transition
#
# ---
# @context any
# @within minestate:interpreter/private/targets/loop
# @macro
#   target: string
#      name of the target state
#   graph: string
#      name of the graph to affect

$data modify storage minestate._temp_:internal action_args.to set value "$(target)"
$data modify storage minestate._temp_:internal to set from storage minestate._temp_:internal machine.graphs."$(graph)".states."$(target)"

execute store result score $count minestate.internal run data get storage minestate._temp_:internal to.transitions
execute store success storage minestate._temp_:internal action_args.final byte 1 if score $count minestate.internal matches 0

$data modify storage minestate._temp_:internal machine.graphs."$(graph)".current set from storage minestate._temp_:internal to

function minestate:interpreter/private/push

data modify storage minestate._temp_:internal callstack.frame.idx set value 0
data modify storage minestate._temp_:internal callstack.frame.arr set from storage minestate._temp_:internal actions
execute store result storage minestate._temp_:internal callstack.frame.len int 1 run data get storage minestate._temp_:internal callstack.frame.arr
scoreboard players set $idx minestate.internal 0
function minestate:interpreter/private/actions/loop with storage minestate._temp_:internal callstack.frame

function minestate:interpreter/private/pop
