#> minestate:builder/graph/private/load_transition
#
# Load a transition by name
#
# ---
# @context any
# @within minestate:builder/graph/private/transition_loop
# @macro
#   target: string
#      The transition to load

$data modify storage minestate._temp_:internal callstack.frame.this set from storage minestate._temp_:internal callstack.frame.transitions."$(target)"
$data modify storage minestate._temp_:internal events.$(target) set value 1b