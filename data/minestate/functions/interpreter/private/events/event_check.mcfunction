#> minestate:interpreter/private/events/event_check
#
# Check an event to see if it exists
#
# ---
# @context any
# @within minestate:interpreter/private/events/loop
# @macro
#   event: string
#      event to check

$return run data get storage minestate._temp_:internal machine._registry_.events.$(event)