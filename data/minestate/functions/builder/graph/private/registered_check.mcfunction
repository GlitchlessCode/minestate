#> minestate:builder/graph/private/registered_check
#
# Check if a guard or action is already registered
#
# ---
# @context any
# @within minestate:builder/graph/private/make_request_loop
# @macro
#   type: "actions" | "guards"
#      type of the request
#   this: int
#      this guard or actions to check

$return run data get storage minestate:builder requests._registry_."$(type)"."$(this)"