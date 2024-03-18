#> minestate:interpreter/private/actions/loop
#
# Loop over all actions, running them
#
# ---
# @context any
# @within
#   minestate:interpreter/private/targets/success
#   minestate:interpreter/private/actions/loop
# @macro
#   idx: int
#      index to access from arr
#   len: int
#      length of arr

$execute if score $idx minestate.internal matches $(len).. run return 1
$data modify storage minestate._temp_:internal callstack.frame.key set from storage minestate._temp_:internal callstack.frame.arr[$(idx)]

function minestate:interpreter/private/actions/load_action with storage minestate._temp_:internal callstack.frame

function minestate:interpreter/private/actions/run with storage minestate._temp_:internal callstack.frame

execute store result score $idx minestate.internal run data get storage minestate._temp_:internal callstack.frame.idx
execute store result storage minestate._temp_:internal callstack.frame.idx int 1 run scoreboard players add $idx minestate.internal 1
function minestate:interpreter/private/actions/loop with storage minestate._temp_:internal callstack.frame