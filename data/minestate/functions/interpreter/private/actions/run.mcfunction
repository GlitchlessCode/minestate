#> minestate:interpreter/private/actions/run
#
# Run an action
#
# ---
# @context any
# @within minestate:interpreter/private/actions/loop
# @macro
#   action: string
#      action to run

$function $(action) with storage minestate._temp_:internal action_args