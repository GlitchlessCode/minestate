#> minestate:init
#
# Initialization function for minestate
#
# ---
# @context root
# @handles #minecraft:load
# @within tag/function minecraft:load

#define storage minestate:internal All nbt data related to the minestate module
#define storage minestate:builder All nbt data related to the minestate builder
#define storage minestate._temp_:internal All transient nbt related to the minestate module

data modify storage minestate:internal definitions set value {}
data modify storage minestate:internal machines set value {}

scoreboard objectives add minestate.internal dummy