let happySongs: [String] = [
  "Butter by BTS",
  "Shivers by Ed Sheeran",
  "I Feel Good by Pitbull, Anthony Watts, DJ White Shadow",
  "Love Again by Dua Lipa",
  "Don't Go Yet by Camila Cabello"
]

let sadSongs: [String] = [
  "Easy On Me by Adele",
  "All Too Well by Taylor Swift",
  "drivers license by Olivia Rodrigo",
  "ONLY by LeeHi",
  "Train Wreck by James Arthur"
]

print("How are you feeling today?", terminator: " ")
let moodInput = readLine()
let mood: String = moodInput!

print("Pick your lucky number!", terminator: " ")
let numberInput = readLine()
let number = numberInput!
let luckyNumber = Int(number) ?? 0

var songIndex: Int = 0
switch mood.lowercased() {
  case "happy":
    if luckyNumber <= happySongs.count {
      songIndex = luckyNumber
    } else {
      songIndex = Int.random(in: 0..<happySongs.count)
    }
    print("Because you're in happy mood, we recommend you to hear \(happySongs[songIndex])")
  case "sad":
    if luckyNumber <= sadSongs.count {
      songIndex = luckyNumber
    } else {
      songIndex = Int.random(in: 0..<sadSongs.count)
    }
    print("It's okay to feel sad, here is a song for you \(sadSongs[songIndex])")
  default:
    print("Sorry we couldn't recommend you any song :(")
}