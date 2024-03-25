# this works, returning a single float
proc nimAdd* (a, b: float): float {.exportc.} =
  a + b

# this doesn't work, returning an array
# proc nimAdd* (a, b: float): array[3, float] {.exportc.} =
#   [a, b, a + b]
