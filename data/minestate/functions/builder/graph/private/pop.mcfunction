#> minestate:builder/graph/private/pop
#
# Pop the current callstack frame
#
# ---
# @context any
# @internal

data modify storage minestate._temp_:internal callstack.frame set value {}
data modify storage minestate._temp_:internal callstack.frame set from storage minestate._temp_:internal callstack.stack[-1]
data remove storage minestate._temp_:internal callstack.stack[-1]