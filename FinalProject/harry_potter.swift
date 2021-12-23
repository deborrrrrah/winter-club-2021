class Wizard {
  var name: String
  var energy: Int
  var energyLimit: Int
  var isAlive: Bool
  var dodgeChance: Int
  var dodgeLimit: Int

  init(name: String, energy: Int, isAlive: Bool, dodgeChance: Int) {
    self.name = name
    self.energy = energy
    self.energyLimit = energy
    self.isAlive = isAlive
    self.dodgeChance = dodgeChance
    self.dodgeLimit = dodgeChance
  }

  func editName(name: String) {
    self.name = name
  }

  func reset() {
    self.energy = self.energyLimit
    self.dodgeChance = self.dodgeLimit
    self.isAlive = true
  }

  func attacked(spell: Spell, isDodge: Bool) {
    if self.isAlive {
      if isDodge && self.dodgeChance > 0 {
        print("\(self.name) dodge the \(spell.name) spell!")
        self.dodgeChance -= 1
      } else {
        print("\(self.name) is attacked by \(spell.name) spell!")
        self.energy -= spell.damagePoint
      }
      if self.energy <= 0 {
        self.isAlive = false
        print("\(self.name) is dead!")
      }
    } else {
      print("\(self.name) is already dead!")
    }
  }

  func printObject() {
    var aliveStatus: String = ""
    if self.isAlive {
      aliveStatus += "😁"
    } else {
      aliveStatus += "😵"
    }
    print("\(self.name) \(aliveStatus) | Power: \(self.energy) / \(self.energyLimit) ")
  }
}

class Spell  {
  var name: String
  var damagePoint: Int

  init(name: String, damagePoint: Int) {
    self.name = name
    self.damagePoint = damagePoint
  }

  func printObject() {
    print("\(self.name) spell | Damage \(self.damagePoint) energy point(s)")
  }
}

func promptString(message: String) -> String {
  print(message, terminator: " ")
  let userInput = readLine()
  let input: String = userInput!
  return input
}

func promptInt(message: String) -> Int {
  let input: String = promptString(message: message)
  let intInput = Int(input) ?? 0
  return intInput
}

func promptBool(message: String) -> Bool {
  let input: String = promptString(message: message)
  let boolInput = input.lowercased() == "yes" || input.lowercased() == "true"
  return boolInput
}

func pickWizard(wizards: [Wizard]) -> Wizard {
  print("----- List of wizards ----")
  var index: Int = 0
  var option: Int = 0
  for wizard in wizards {
    print("Wizard #\(index)")
    wizard.printObject()
    index += 1
  }
  repeat {
    option = promptInt(message: "Pick a wizard:")
    if option >= wizards.count {
      print("There is no Wizard #\(option)")
    }
  } while option >= wizards.count
  return wizards[option]
}

func pickSpell(spells: [Spell]) -> Spell {
  print("----- List of spells ----")
  var index: Int = 0
  for spell in spells {
    print("Spell #\(index)")
    spell.printObject()
    index += 1
  }
  
  var option: Int = 0
  repeat {
    option = promptInt(message: "Choose a spell:")
    if option >= spells.count {
      print("There is no Spell #\(option)")
    }
  } while option >= spells.count
  return spells[option]
}

var spells: [Spell] = [
  Spell(name: "Expelliarmus", damagePoint: 20),
  Spell(name: "Reducto", damagePoint: 50),
  Spell(name: "Stupefy", damagePoint: 30)
]

var wizards: [Wizard] = [
  Wizard(name: "Hermione Granger", energy: 100, isAlive: true, dodgeChance: 5),
  Wizard(name: "Ron", energy: 50, isAlive: true, dodgeChance: 3),
  Wizard(name: "Harry Potter", energy: 150, isAlive: true, dodgeChance: 7)
]

var isProgramRunning: Bool = true

print("===== Welcome to Harry Potter RPG =====")
var currentWizard: Wizard = pickWizard(wizards: wizards)

repeat {
  currentWizard.reset()
  let optionMessage: String = """
  \nHello \(currentWizard.name)!
  ===== Game Actions =====
  1. Go to Godric Hollow
  2. Pick a new character
  3. Exit
  """
  let option: Int = promptInt(message: "\(optionMessage)\nChoose your action:")
  print()
  switch option {
    case 1:
      let batilda: Wizard = Wizard(name: "Bathilda Bagshot", energy: 100, isAlive: true, dodgeChance: 5)
      print("Welcome to Godric Hollow! You'll have a duel with \(batilda.name)")
      for round in stride(from: 1, to: 4, by: 1) {
        print("\nRound #\(round)")
        currentWizard.printObject()
        batilda.printObject()

        print() 
        print("\(batilda.name)'s turn")
        let spellIndex: Int = Int.random(in: 0..<spells.count)
        print("\(batilda.name) already pick a spell.")
        let isDodge: Bool = promptBool(message: "Do you want to dodge the upcoming spell?")
        if isDodge {
          currentWizard.attacked(spell: spells[spellIndex], isDodge: true)
        } else {
          currentWizard.attacked(spell: spells[spellIndex], isDodge: false)
        }

        if !currentWizard.isAlive {
          break
        }

        print("\n\(currentWizard.name)'s turn")
        let spell: Spell = pickSpell(spells: spells)
        batilda.attacked(spell: spell, isDodge: false)

        if !batilda.isAlive {
          break
        }
      }
      if !currentWizard.isAlive && batilda.isAlive {
        print("You lose!")
        break
      } else if currentWizard.isAlive && !batilda.isAlive {
        print("You win!")
      } else {
        print("It's a draw!")
      }
    case 2:
      print("----- Pick a new wizard -----")
      currentWizard = pickWizard(wizards: wizards)
    case 3:
      print("----- Exiting program -----")
      isProgramRunning = false
      print("Bye!")
    default:
      print("Sorry there is no such options :(")
  }
} while isProgramRunning