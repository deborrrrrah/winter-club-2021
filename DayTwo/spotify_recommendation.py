import random

happy_songs = [
  "Butter by BTS",
  "Shivers by Ed Sheeran",
  "I Feel Good by Pitbull, Anthony Watts, DJ White Shadow",
  "Love Again by Dua Lipa",
  "Don't Go Yet by Camila Cabello"
]

sad_songs = [
  "Easy On Me by Adele",
  "All Too Well by Taylor Swift",
  "drivers license by Olivia Rodrigo",
  "ONLY by LeeHi",
  "Train Wreck by James Arthur"
]

mood = input("How are you feeling today? ")
lucky_number = int(input("Pick your lucky number! "))

if mood.lower() == "happy":
  if lucky_number <= len(happy_songs):
    index = lucky_number
  else:
    index = random.randint(0, len(happy_songs)-1)
  print("Because you're in happy mood, we recommend you to hear", happy_songs[index])
elif mood.lower() == "sad":
  if lucky_number <= len(sad_songs):
    index = lucky_number
  else:
    index = random.randint(0, len(sad_songs)-1)
  print("It's okay to feel sad, here is a song for you", happy_songs[index])
else:
  print("Sorry we couldn't recommend you any song :(")