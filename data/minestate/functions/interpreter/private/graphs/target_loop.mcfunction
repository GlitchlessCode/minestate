#> minestate:interpreter/private/graphs/target_loop
#
# Start loop over targets
#
# ---
# @context any
# @within minestate:interpreter/private/graphs/loop

data modify storage minestate._temp_:internal action_args.from set from storage minestate._temp_:internal callstack.frame.graph.current.name

#
function minestate:interpreter/private/push

data modify storage minestate._temp_:internal callstack.frame.idx set value 0
data modify storage minestate._temp_:internal callstack.frame.arr set from storage minestate._temp_:internal transition.target
execute store result storage minestate._temp_:internal callstack.frame.len int 1 run data get storage minestate._temp_:internal callstack.frame.arr
scoreboard players set $idx minestate.internal 0
function minestate:interpreter/private/targets/loop with storage minestate._temp_:internal callstack.frame

function minestate:interpreter/private/pop
#