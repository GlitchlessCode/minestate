#> minestate:builder/new
#
# Starts a new minestate builder, clearing any in progress state machine builder
#
# ---
# @context any
# @api
# @macro
#   name: string
#      The name of the state machine

$data modify storage minestate:builder builder set value {name:"$(name)", graph_count:0, graphs:{}, _registry_:{graphs:[],events:{}}}
data modify storage minestate:builder guards set value {}
data modify storage minestate:builder actions set value {}
data modify storage minestate:builder requests set value {guards:[],actions:[],_registry_:{guards:{},actions:{}}}
scoreboard players set $graph_count minestate.internal 0