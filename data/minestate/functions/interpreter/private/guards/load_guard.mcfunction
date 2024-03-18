#> minestate:interpreter/private/guards/load_guard
#
# Load a guard into memory
#
# ---
# @context any
# @within
#   minestate:interpreter/private/guards/loop
# @macro
#   key: string
#      guard to access

$data modify storage minestate._temp_:internal callstack.frame.guard set from storage minestate._temp_:internal machine.guards."$(key)"