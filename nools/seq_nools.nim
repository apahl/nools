import strutils

proc removeEmpty(s: var seq[string]) =
  ## Remove elements that are empty or only contain whitespace from the right end
  while s.len > 0 and s[^1].isNilOrWhitespace:
    s.setLen(s.len-1)

proc seqFromEnum*[T: enum](enm: typedesc[T]): seq[T] =
  ## Generates a sequence from the all members of an enum.
  ##
  ## Usage:
  ##
  ## .. code-block::
  ##   type Row = enum A, B, C, D, E, F
  ##   let row = seqFromEnum(Row) # -> @[A, B, C, D, E, F]

  result = @[]
  for i in T:
    result.add(i)
