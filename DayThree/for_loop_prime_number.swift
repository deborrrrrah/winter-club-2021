print("Enter the number:", terminator: " ")
let userInput = readLine()
let numberInput = userInput!
let myNum = Int(numberInput) ?? 0

var numberOfFactor: Int = 0

for divisor in stride(from: 1, to: myNum + 1, by: 1) {
  if myNum % divisor == 0 {
    numberOfFactor += 1
  }
}

if numberOfFactor == 2 {
  print("\(myNum) is a prime number!")
} else {
  print("\(myNum) is not a prime number :D")
}
