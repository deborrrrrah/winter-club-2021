my_num = int(input("Enter a number: "))

num_of_factor = 0
for divisor in range(1, my_num + 1):
  if my_num % divisor == 0:
    num_of_factor += 1

if num_of_factor == 2:
  print(my_num, "is a prime number")
else:
  print(my_num, "is not a prime number")