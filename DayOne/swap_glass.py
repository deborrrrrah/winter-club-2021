white_cup = "coffee"
transparent_cup = "tea"
transparent_glass = ""

print("Initial state")
print("White cup:", white_cup)
print("Transparent cup:", transparent_cup)
print("Transparent glass:", transparent_glass)

print()

print("Swapping!")
transparent_glass = transparent_cup
transparent_cup = white_cup
white_cup = transparent_glass

print()

print("End state")
print("White cup:", white_cup)
print("Transparent cup:", transparent_cup)
print("Transparent glass:", transparent_glass)