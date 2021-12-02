my_num = int(input("Enter the number: "))

print("Approach 1")
if my_num % 7 == 0 or my_num % 10 == 7 or my_num // 10 == 7:
  print("Boom")
else:
  print("Safe number")

print()

print("Approach 2")
if my_num % 7 == 0 or "7" in str(my_num):
  print("Boom")
else:
  print("Safe number")