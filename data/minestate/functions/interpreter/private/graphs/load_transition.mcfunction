#> minestate:interpreter/private/graphs/load_transition
#
# Load a transition into memory
#
# ---
# @context any
# @within
#   minestate:interpreter/private/graphs/loop
# @macro
#   event: string
#      transition to access

data modify storage minestate._temp_:internal transition set value "none"
$data modify storage minestate._temp_:internal transition set from storage minestate._temp_:internal callstack.frame.graph.current.transitions."$(event)"