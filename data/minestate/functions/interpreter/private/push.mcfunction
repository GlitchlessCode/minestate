#> minestate:interpreter/private/push
#
# Push a new callstack frame
#
# ---
# @context any
# @internal

data modify storage minestate._temp_:internal callstack.stack append from storage minestate._temp_:internal callstack.frame
data modify storage minestate._temp_:internal callstack.frame set value {}