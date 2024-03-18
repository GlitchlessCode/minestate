#> minestate:builder/graph/states/transitions/private/finalize
#
# Finalize the current transition
#
# ---
# @context any
# @within minestate:builder/graph/states/transitions/finalize
# @macro
#   name: string
#      name of the transition

$data modify storage minestate:builder state.transitions."$(name)" set from storage minestate:builder transition
$data modify storage minestate:builder state._transitions_ append value "$(name)"