my_num = int(input("Enter a number: "))

num_of_factor = 0
divisor = 1
while divisor <= my_num:
  if my_num % divisor == 0:
    num_of_factor += 1
  divisor += 1

if num_of_factor == 2:
  print(my_num, "is a prime number")
else:
  print(my_num, "is not a prime number")