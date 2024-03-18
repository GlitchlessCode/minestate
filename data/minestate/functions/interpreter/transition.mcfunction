#> minestate:interpreter/transition
#
# Transition a target interpreter between states, evaluating guard conditions, and triggering actions
#
# Does not fail if no transition is triggered by an event, will remain in the same state.
#
# Will evaluate all events in the array sequentially (From index 0 upwards)
#
# # Fails
# E01 Will fail if the target does not exist
#
# E02 Will fail if this state machine is aleady processing an event (This should only occur if a guard or action tries to affect this state machine)
#
# E03 Will fail if an event does not exist
#
# ---
# @context any
# @api
# @macro
#   target: string
#      Target interpreter to transition on
#   events: string[]
#      Events to trigger

# [TRANSITION]
#  ├If target machine does not exist:
#  │ ╰Fail with Error Code 1
#  ├Setup Call Stack
#  ├Reset action argument compound
#  ╰Loop over all events
#    ├If event does not exist:
#    │ ╰Fail with Error Code 2
#    ╰Loop over all graphs
#      ├Read current state transition for event
#      ╰If transition exists: 
#        ╰Loop over all targets 
#        ▲ ├Loop over all guards 
#        │ │ ├Run guard
#        │ │ ╰If guard fails:
#        ╰─:───┴continue to next target
#          ├Read target state
#          ├Loop over all actions
#          │ ╰Call actions with following data:
#          │   ├Interpreter name !
#          │   ├State machine name !
#          │   ├Graph name !
#          │   ├From state name
#          │   ├To state name
#          │   ├Event name !
#          │   ╰If To state is a final state (Has no transitions)
#          ╰Override current state with target state     

$execute store success score $success minestate.internal run data get storage minestate:internal machines.$(target)
execute if score $success minestate.internal matches 0 run return run function minestate:interpreter/private/fail {code:1}

$execute if data storage minestate:internal {machines:{"$(target)":{locked:1b}}} run return run function minestate:interpreter/private/fail {code:2}

$data modify storage minestate._temp_:internal machine set from storage minestate:internal machines.$(target)
$data modify storage minestate:internal machines.$(target).locked set value 1b

data modify storage minestate._temp_:internal callstack set value {stack:[],frame:{}}

$data modify storage minestate._temp_:internal action_args set value {interpreter:"$(target)"}
data modify storage minestate._temp_:internal action_args.machine set from storage minestate._temp_:internal machine.name

scoreboard players set $error minestate.internal 0

data modify storage minestate._temp_:internal callstack.frame.idx set value 0
$data modify storage minestate._temp_:internal callstack.frame.arr set value $(events)
execute store result storage minestate._temp_:internal callstack.frame.len int 1 run data get storage minestate._temp_:internal callstack.frame.arr
scoreboard players set $idx minestate.internal 0
function minestate:interpreter/private/events/loop with storage minestate._temp_:internal callstack.frame
$data modify storage minestate:internal machines.$(target) set from storage minestate._temp_:internal machine

execute unless score $error minestate.internal matches 0 run return fail