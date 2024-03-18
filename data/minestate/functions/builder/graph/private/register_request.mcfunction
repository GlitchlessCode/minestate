#> minestate:builder/graph/private/register_request
#
# Register guard or action
#
# ---
# @context any
# @within minestate:builder/graph/private/make_request_loop
# @macro
#   type: "actions" | "guards"
#      type of the request
#   this: string
#      this guard or action to register

$data modify storage minestate:builder requests._registry_."$(type)"."$(this)" set value 1b
$data modify storage minestate:builder requests."$(type)" append value "$(this)"