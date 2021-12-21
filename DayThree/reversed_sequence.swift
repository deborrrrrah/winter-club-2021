func reverseSeq(n: Int) -> [Int] {
  var result: [Int] = []
  for i in stride(from: n, to: 0, by: -1) {
    result.append(i)
  }
  return result
}