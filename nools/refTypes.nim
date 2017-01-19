# module refTypes.nim

type List*[T] = ref object
  ## Python-like list, a ref seq
  ## Code by Arrrr, IRC 16-Dec-2016
  innerSeq*:  seq[T]

proc newList*[T](): List[T] = List[T](innerSeq: newSeq[T]())

proc add*[T](list: List[T], t: T) = list.innerSeq.add(t)

proc `$`*[T](list: List[T]): string = $list.innerSeq

iterator items*[T](list: List[T]): T =
  for i in list.innerSeq:
    yield i

when isMainModule:
  let list1 = newList[int]()
  list1.add(5)
  list1.add(6)

  let list2 = list1
  list2.add(7)

  assert list1 == list2  # they are the same,
                         # both list1 and list2 point to the same data
  echo "[refTypes]          all tests passed."
