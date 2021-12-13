var whiteCup: String = "coffee"
var transparentCup: String = "tea"
var transparentGlass: String = ""

// Ignore following code
print("Initial State \nWhite Cup: \(whiteCup) \nTransparent Cup: \(transparentCup) \nTransparent Glass: \(transparentGlass)")

transparentGlass = transparentCup
transparentCup = whiteCup
whiteCup = transparentGlass

// Ignore following code
print("\nEnd State \nWhite Cup: \(whiteCup) \nTransparent Cup: \(transparentCup) \nTransparent Glass: \(transparentGlass)")