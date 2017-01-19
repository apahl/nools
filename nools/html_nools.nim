var html: string = ""

template text(txt: string) =
  html = html & txt

template openTag(name: string, options: string) =
  html = html & "<" & name
  if options.len > 1:
    html = html & " " & options
  html = html & ">"

template closeTag(name: string, newline=true) =
  html = html & "</" & name & ">"
  if newline:
    html = html & "\n"

template b(opt=""; body: untyped) =
  openTag("b", options=opt)
  body
  closeTag("b", false)

template b(body: untyped) =
  b(opt="", body)

template p(opt=""; body: untyped) =
  openTag("p", options=opt)
  body
  closeTag("p", true)

template p(body: untyped) =
  p(opt="", body)

when isMainModule:
  p("""id=123"""):
    text("Test1")
    p:
      b:
        text("Test2")
        text("Test3")

  echo html
