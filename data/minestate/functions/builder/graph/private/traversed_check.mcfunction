#> minestate:builder/graph/private/traversed_check
#
# Check if the state node has been traversed
#
# ---
# @context any
# @within minestate:builder/graph/private/target_loop
# @macro
#   target: string
#      The target to check

$return run data get storage minestate._temp_:internal traversed."$(target)"