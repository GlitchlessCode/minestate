#> minestate:interpreter/private/guards/run
#
# Run a guard
#
# ---
# @context any
# @within minestate:interpreter/private/guards/loop
# @macro
#   guard: string
#      guard to run

$execute store success score $success minestate.internal run function $(guard)