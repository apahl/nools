# Package

version       = "0.1.6"
author        = "Axel Pahl"
description   = "Personal Nim tools and helpers."
license       = "MIT"

# Dependencies

requires "nim >= 0.15.3"

const
  project = "nools"
  modules = ["seq_nools", "stat_nools", "refTypes"]

task doc, "build the documentation":
  echo "\nBuilding documentation in doc/"
  for m in modules:
    let taskCmd = "nim -o:doc/" & m &  ".html doc " & project & "/" & m & ".nim"
    exec taskCmd

task test, "run the tests":
  echo "\nRunning tests..."
  for m in modules:
    let taskCmd = "nim -r --verbosity:0 --hints:off c " & project & "/" & m & ".nim"
    exec taskCmd
    rmFile project & "/" & toExe(m)