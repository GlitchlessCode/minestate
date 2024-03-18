#> minestate:interpreter/private/actions/load_action
#
# Load a action into memory
#
# ---
# @context any
# @within
#   minestate:interpreter/private/actions/loop
# @macro
#   key: string
#      action to access

$data modify storage minestate._temp_:internal callstack.frame.action set from storage minestate._temp_:internal machine.actions."$(key)"