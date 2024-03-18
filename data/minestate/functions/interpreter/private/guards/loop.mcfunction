#> minestate:interpreter/private/guards/loop
#
# Loop over all guards, returning either 1 or 0
#
# ---
# @context any
# @within
#   minestate:interpreter/private/targets/loop
#   minestate:interpreter/private/guards/loop
# @macro
#   idx: int
#      index to access from arr
#   len: int
#      length of arr

$execute if score $idx minestate.internal matches $(len).. run return 1
$data modify storage minestate._temp_:internal callstack.frame.key set from storage minestate._temp_:internal callstack.frame.arr[$(idx)]

function minestate:interpreter/private/guards/load_guard with storage minestate._temp_:internal callstack.frame

scoreboard players set $success minestate.internal 0
function minestate:interpreter/private/guards/run with storage minestate._temp_:internal callstack.frame
execute if score $success minestate.internal matches 0 run return fail

execute store result score $idx minestate.internal run data get storage minestate._temp_:internal callstack.frame.idx
execute store result storage minestate._temp_:internal callstack.frame.idx int 1 run scoreboard players add $idx minestate.internal 1
return run function minestate:interpreter/private/guards/loop with storage minestate._temp_:internal callstack.frame