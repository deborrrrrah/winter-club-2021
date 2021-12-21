print("Enter your square size:", terminator: " ")
let userInput = readLine()
let numberInput = userInput!
let size = Int(numberInput) ?? 0

// Approach 1
print("Approach 1")
for row in stride(from: 1, to: size + 1, by: 1) {
  var rowContent: String = ""
  for col in stride(from: 1, to: size + 1, by: 1) {
    if row == 1 || row == size || col == 1 || col == size {
      rowContent += "#"
    } else {
      rowContent += " "
    }
  }
  print(rowContent)
}

// Approach 2
print("\nApproach 2")
for row in stride(from: 1, to: size + 1, by: 1) {
  for col in stride(from: 1, to: size + 1, by: 1) {
    if row == 1 || row == size || col == 1 || col == size {
      print("#", terminator: "")
    } else {
      print(" ", terminator: "")
    }
  }
  print()
}