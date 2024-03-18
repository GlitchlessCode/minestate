#> minestate:interpreter/private/fail
#
# Trigger fail condition
#
# ---
# @context any
# @within minestate:interpreter/**
# @macro
#   code: int
#      error code

$scoreboard players set $error minestate.internal $(code)
return fail