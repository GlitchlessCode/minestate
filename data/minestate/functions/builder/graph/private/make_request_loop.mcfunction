#> minestate:builder/graph/private/make_request_loop
#
# Register a request to the current builder
#
# ---
# @context any
# @within
#   minestate:builder/graph/private/target_loop
#   minestate:builder/graph/private/make_request_loop
# @macro
#   type: "actions" | "guards"
#      type of the request
#   idx: int
#      index to access from arr
#   len: int
#      length of arr

$execute if score $idx minestate.internal matches $(len).. run return 1
$data modify storage minestate._temp_:internal callstack.frame.this set from storage minestate._temp_:internal callstack.frame.arr[$(idx)]

execute store result score $registered minestate.internal run function minestate:builder/graph/private/registered_check with storage minestate._temp_:internal callstack.frame
execute unless score $registered minestate.internal matches 1 run function minestate:builder/graph/private/register_request with storage minestate._temp_:internal callstack.frame

execute store result score $idx minestate.internal run data get storage minestate._temp_:internal callstack.frame.idx
execute store result storage minestate._temp_:internal callstack.frame.idx int 1 run scoreboard players add $idx minestate.internal 1
function minestate:builder/graph/private/make_request_loop with storage minestate._temp_:internal callstack.frame