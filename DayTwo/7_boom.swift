print("Enter the number:", terminator: " ")
let userInput = readLine()
let numberInput = userInput!
let myNum = Int(numberInput) ?? 0

print("Approach 1")
if myNum % 7 == 0 || myNum % 10 == 7 || myNum / 10 == 7 {
  print("Boom")
} else {
  print("Safe number")
}

print()

print("Approach 2")
if myNum % 7 == 0 || numberInput.contains("7"){
  print("Boom")
} else {
  print("Safe number")
}