print("Enter the number:", terminator: " ")
let userInput = readLine()
let numberInput = userInput!
let myNum = Int(numberInput) ?? 0

func isFactorOf(num: Int, factor: Int) -> Bool {
  return num % factor == 0
}

func isContainsDigit(num: Int, digit: Int) -> Bool {
  return num % 10 == digit || num / 10 == digit
}

func isContainsChar(string: String, char: Character) -> Bool {
  return string.contains(char)
}

print("Approach 1")
if isFactorOf(num: myNum, factor: 7) || isContainsDigit(num: myNum, digit: 7) {
  print("Boom")
} else {
  print("Safe number")
}

print()

print("Approach 2")
if isFactorOf(num: myNum, factor: 7) || isContainsChar(string: numberInput, char: "7") {
  print("Boom")
} else {
  print("Safe number")
}