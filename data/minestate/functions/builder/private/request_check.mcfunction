#> minestate:builder/private/request_check
#
# Check a request to see if it exists
#
# ---
# @context any
# @within minestate:builder/private/request_check_loop
# @macro
#   key: string
#      key to check

$return run execute if data storage minestate._temp_:internal obj."$(key)"
