print("Enter your square size:", terminator: " ")
let userInput = readLine()
let numberInput = userInput!
let size = Int(numberInput) ?? 0

let firstIndex: Int = 0
let lastIndex: Int = size - 1

// Approach 1
print("Approach 1")
for row in stride(from: firstIndex, to: size, by: 1) {
  var rowContent: String = ""
  for col in stride(from: firstIndex, to: size, by: 1) {
    if row == firstIndex || row == lastIndex || col == firstIndex || col == lastIndex {
      rowContent += "#"
    } else {
      rowContent += " "
    }
  }
  print(rowContent)
}

// Approach 2
print("\nApproach 2")
for row in stride(from: firstIndex, to: size, by: 1) {
  for col in stride(from: firstIndex, to: size, by: 1) {
    if row == firstIndex || row == lastIndex || col == firstIndex || col == lastIndex {
      print("#", terminator: "")
    } else {
      print(" ", terminator: "")
    }
  }
  print()
}