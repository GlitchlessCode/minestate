#> minestate:builder/graph/private/fail
#
# Trigger fail condition
#
# ---
# @context any
# @within minestate:builder/**
# @macro
#   code: int
#      error code

$scoreboard players set $error minestate.internal $(code)
return fail