#> minestate:builder/graph/private/target_loop
#
# Traverse all transition targets
#
# ---
# @context any
# @within
#   minestate:builder/graph/private/transition_loop
#   minestate:builder/graph/private/target_loop
# @macro
#   idx: int
#      index to access from arr
#   len: int
#      length of arr

$execute if score $idx minestate.internal matches $(len).. run return 1
$data modify storage minestate._temp_:internal callstack.frame.this set from storage minestate._temp_:internal callstack.frame.arr[$(idx)]

data modify storage minestate._temp_:internal arr set from storage minestate._temp_:internal callstack.frame.this.actions
function minestate:builder/graph/private/push
data modify storage minestate._temp_:internal callstack.frame.type set value "actions"
data modify storage minestate._temp_:internal callstack.frame.idx set value 0
data modify storage minestate._temp_:internal callstack.frame.arr set from storage minestate._temp_:internal arr
execute store result storage minestate._temp_:internal callstack.frame.len int 1 run data get storage minestate._temp_:internal callstack.frame.arr
scoreboard players set $idx minestate.internal 0
function minestate:builder/graph/private/make_request_loop with storage minestate._temp_:internal callstack.frame
function minestate:builder/graph/private/pop


data modify storage minestate._temp_:internal arr set from storage minestate._temp_:internal callstack.frame.this.guards
function minestate:builder/graph/private/push
data modify storage minestate._temp_:internal callstack.frame.type set value "guards"
data modify storage minestate._temp_:internal callstack.frame.idx set value 0
data modify storage minestate._temp_:internal callstack.frame.arr set from storage minestate._temp_:internal arr
execute store result storage minestate._temp_:internal callstack.frame.len int 1 run data get storage minestate._temp_:internal callstack.frame.arr
scoreboard players set $idx minestate.internal 0
function minestate:builder/graph/private/make_request_loop with storage minestate._temp_:internal callstack.frame
function minestate:builder/graph/private/pop

#
execute store result score $traversed minestate.internal run function minestate:builder/graph/private/traversed_check with storage minestate._temp_:internal callstack.frame.this
execute unless score $traversed minestate.internal matches 1 run function minestate:builder/graph/private/traverse with storage minestate._temp_:internal callstack.frame.this
#

execute store result score $idx minestate.internal run data get storage minestate._temp_:internal callstack.frame.idx
execute store result storage minestate._temp_:internal callstack.frame.idx int 1 run scoreboard players add $idx minestate.internal 1
function minestate:builder/graph/private/target_loop with storage minestate._temp_:internal callstack.frame