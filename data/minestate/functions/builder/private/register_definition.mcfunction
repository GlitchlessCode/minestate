#> minestate:builder/private/register_definition
#
# Register the current builder into the state machine definition set
#
# ---
# @context any
# @within minestate:builder/finalize
# @macro
#   name: string
#      the name of the builder

$data modify storage minestate:internal definitions.$(name) set from storage minestate:builder builder
$data modify storage minestate:internal definitions.$(name).guards set from storage minestate:builder guards
$data modify storage minestate:internal definitions.$(name).actions set from storage minestate:builder actions
