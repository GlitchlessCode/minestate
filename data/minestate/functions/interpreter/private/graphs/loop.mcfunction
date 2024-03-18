#> minestate:interpreter/private/graphs/loop
#
# Loop over all graphs
#
# ---
# @context any
# @within
#   minestate:interpreter/private/events/loop
#   minestate:interpreter/private/graphs/loop
# @macro
#   idx: int
#      index to access from arr
#   len: int
#      length of arr

$execute if score $idx minestate.internal matches $(len).. run return 1
$data modify storage minestate._temp_:internal callstack.frame.key set from storage minestate._temp_:internal callstack.frame.arr[$(idx)]

function minestate:interpreter/private/graphs/load_graph with storage minestate._temp_:internal callstack.frame

function minestate:interpreter/private/graphs/load_transition with storage minestate._temp_:internal

execute unless data storage minestate._temp_:internal {transition:"none"} run function minestate:interpreter/private/graphs/target_loop

execute store result score $idx minestate.internal run data get storage minestate._temp_:internal callstack.frame.idx
execute store result storage minestate._temp_:internal callstack.frame.idx int 1 run scoreboard players add $idx minestate.internal 1
function minestate:interpreter/private/graphs/loop with storage minestate._temp_:internal callstack.frame