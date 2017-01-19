template withFile(f: untyped, filename: string, mode: FileMode,
                  body: untyped): untyped =
  let fn = filename
  var f: File
  if open(f, fn, mode):
    try:
      body
    finally:
      close(f)
  else:
    quit("cannot open: " & fn)
