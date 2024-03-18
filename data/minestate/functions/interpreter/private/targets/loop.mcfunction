#> minestate:interpreter/private/targets/loop
#
# Loop over all targets
#
# ---
# @context any
# @within
#   minestate:interpreter/private/graphs/target_loop
#   minestate:interpreter/private/targets/loop
# @macro
#   idx: int
#      index to access from arr
#   len: int
#      length of arr

$execute if score $idx minestate.internal matches $(len).. run return 1
$data modify storage minestate._temp_:internal callstack.frame.target set from storage minestate._temp_:internal callstack.frame.arr[$(idx)]

data modify storage minestate._temp_:internal guards set from storage minestate._temp_:internal callstack.frame.target.guards
data modify storage minestate._temp_:internal actions set from storage minestate._temp_:internal callstack.frame.target.actions
data modify storage minestate._temp_:internal callstack.frame.target.graph set from storage minestate._temp_:internal action_args.graph

function minestate:interpreter/private/push

data modify storage minestate._temp_:internal callstack.frame.idx set value 0
data modify storage minestate._temp_:internal callstack.frame.arr set from storage minestate._temp_:internal guards
execute store result storage minestate._temp_:internal callstack.frame.len int 1 run data get storage minestate._temp_:internal callstack.frame.arr
scoreboard players set $idx minestate.internal 0
execute store success score $success minestate.internal run function minestate:interpreter/private/guards/loop with storage minestate._temp_:internal callstack.frame

function minestate:interpreter/private/pop

execute if score $success minestate.internal matches 1 run return run function minestate:interpreter/private/targets/success with storage minestate._temp_:internal callstack.frame.target

execute store result score $idx minestate.internal run data get storage minestate._temp_:internal callstack.frame.idx
execute store result storage minestate._temp_:internal callstack.frame.idx int 1 run scoreboard players add $idx minestate.internal 1
function minestate:interpreter/private/targets/loop with storage minestate._temp_:internal callstack.frame