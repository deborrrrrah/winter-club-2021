size = int(input("Enter your square size: "))

for row in range(size):
  row_content = ""
  for col in range(size):
    if row == 0 or col == 0 or row == size - 1 or col == size - 1:
      row_content += "$"
    else:
      row_content += " "
  print(row_content)