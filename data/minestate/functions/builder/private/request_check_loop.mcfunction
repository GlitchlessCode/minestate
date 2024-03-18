#> minestate:builder/private/request_check_loop
#
# Loop over requests for validation
#
# ---
# @context any
# @within
#   minestate:builder/finalize
#   minestate:builder/private/request_check_loop
# @macro
#   idx: int
#      index to access from arr
#   len: int
#      length of arr

$execute if score $idx minestate.internal matches $(len).. run return 1
$data modify storage minestate._temp_:internal key set from storage minestate._temp_:internal arr[$(idx)]

#
execute store result score $exists minestate.internal run function minestate:builder/private/request_check with storage minestate._temp_:internal
execute unless score $exists minestate.internal matches 1 run return run function minestate:builder/graph/private/fail {code:2}
#

execute store result storage minestate._temp_:internal idx int 1 run scoreboard players add $idx minestate.internal 1
function minestate:builder/private/request_check_loop with storage minestate._temp_:internal