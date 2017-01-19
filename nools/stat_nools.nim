import algorithm

## This module implements the `median` and the `median absolute deviation` (MAD).

type
  Median = tuple[value, mad: float]

proc median[T: float | int](oa: openarray[T]): float =
  let ln = oa.len
  doAssert(ln > 0, "Array must not be empty.")
  let
    mid = ln div 2
    sorted_oa = sorted(oa, system.cmp[T])

  if ln mod 2 == 1:
    result = float(sorted_oa[mid])
  else:
    result = (sorted_oa[mid-1] + sorted_oa[mid]) / 2

proc mad[T: float | int](oa: openarray[T], medVal: float): float =
  var dist: seq[float] = @[]
  for el in oa:
    dist.add(abs(el.float - medVal))
  result = median(dist)

proc calcMedianMAD*[T: float | int](oa: openarray[T]): Median =
  result.value = median(oa)
  result.mad = mad(oa, result.value)


when isMainModule:
  var med = calcMedianMAD([5, 3, 4, 1, 2])
  assert(med.value == 3.0)
  assert(med.mad == 1.0)
  med = calcMedianMAD([5.0, 3, 4, 1, 2])
  assert(med.value == 3.0)
  assert(med.mad == 1.0)
  med = calcMedianMAD([5.0, 3, 6, 4, 1, 2])
  assert(med.value == 3.5)
  assert(med.mad == 1.5)
  echo "[stat_nools]        all tests passed."
