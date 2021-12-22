class User {
  var userName: String
  var realName: String
  var isVerified: Bool

  init(userName: String, realName: String, isVerified: Bool) {
    self.userName = userName
    self.realName = realName
    self.isVerified = isVerified
  }

  func editUserName(userName: String) {
    self.userName = userName
  }

  func editRealName(realName: String) {
    self.realName = realName
  }

  func editIsVerified(isVerified: Bool) {
    self.isVerified = isVerified
  }

  func printObject() {
    var verifiedStatus: String = ""
    if self.isVerified {
      verifiedStatus += "☑️"
    } else {
      verifiedStatus += ""
    }
    print("Username: \(self.userName) \(verifiedStatus) | Real name: \(self.realName) ")
  }
}

class Post {
  var title: String
  var description: String
  var owner: User
  var likers: [User]

  init(title: String, description: String, owner: User, likers: [User]) {
    self.title = title
    self.description = description
    self.owner = owner
    self.likers = likers
  }

  func editTitle(title: String) {
    self.title = title
  }

  func editDescription(description: String) {
    self.description = description
  }

  func editOwner(owner: User) {
    self.owner = owner
  }

  func addLiker(liker: User) {
    var isUserFound: Bool = false
    var index: Int = 0
    while !isUserFound && index < self.likers.count {
      if liker.userName == self.likers[index].userName {
        isUserFound = true
      } else {
        index += 1
      }
    }
    if isUserFound {
      print("User \(liker.userName) already like the post!")
    } else {
      self.likers.append(liker)
    }
  }

  func removeLiker(index: Int) {
    if index < self.likers.count {
      self.likers.remove(at: index)
    }
  }

  func printObject() {
    print("\(self.title)\n\(self.description)\nPosted by \(self.owner.userName)")
    print("Likers:")
    for liker in self.likers {
      print("- \(liker.userName)")
    }
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

func isUserExist(users: [String: User], userName: String) -> Bool {
  return users[userName] != nil
}

func newUserPrompt() -> User {
  print("----- Register new user -----")
  let userName = promptString(message: "Insert your user name:")
  let realName = promptString(message: "Insert your real name:")
  let isVerified = promptBool(message: "Are you a verified account?")
  return User(userName: userName, realName: realName, isVerified: isVerified)
}

func newPostPrompt(user: User) -> Post {
  print("----- Add new posts -----")
  let title = promptString(message: "Insert your post title:")
  let description = promptString(message: "Insert your post description:")
  return Post(title: title, description: description, owner: user, likers: [])
}

func getUser(users: [String: User], userName: String) -> User {
  let user: User = users[userName]!
  return user
}

var users: [String: User] = [
  "deborrrrraht": User(userName: "deborrrrraht", realName: "Deborah Tampubolon", isVerified: false),
  "smindrawati": User(userName: "smindrawati", realName: "Sri Mulyani Indrawati", isVerified: true),
  "generationgirl.id": User(userName: "generationgirl.id", realName: "Generation Girl", isVerified: false)
]

var posts: [Post] = [
  Post(title: "Mother's Day", description: "Happy mother's day mom! We love you lot💖", owner: getUser(users: users, userName: "deborrrrraht"), likers: []),
  Post(title: "Winter Club 2021", description: "Rise and shine girls! Winter club 2021 is coming❄️", owner: getUser(users: users, userName: "generationgirl.id"), likers: [])
]

var isProgramRunning: Bool = true

var loggedUserName = promptString(message: "To log in, please tell us your username:")
if !isUserExist(users: users, userName: loggedUserName) {
  print("You haven't register to instagram! :( Please register first!")
  let newUser = newUserPrompt()
  users[newUser.userName] = newUser
  print()
}

var loggedUser: User = getUser(users: users, userName: loggedUserName)

repeat {
  let optionMessage: String = """
  \nHello \(loggedUser.userName)!
  ===== Instagram Actions =====
  1. Register new user
  2. Add new posts
  3. See posts
  4. See available users
  5. Like a post
  6. Log in as different user
  7. Exit
  """
  let option: Int = promptInt(message: "\(optionMessage)\nChoose your action:")
  print()
  switch option {
    case 1:
      let newUser = newUserPrompt()
      users[newUser.userName] = newUser
    case 2:
      let newPost = newPostPrompt(user: getUser(users: users, userName: loggedUser.userName))
      posts.append(newPost)
    case 3:
      print("----- See posts -----")
      var index: Int = 0
      for post in posts {
        print("Post #\(index)")
        post.printObject()
        print()
        index += 1
      }
    case 4:
      print("----- See available users -----")
      for (_, user) in users {
        user.printObject()
      }
    case 5:
      print("----- Like a post -----")
      let postIndex: Int = promptInt(message: "Which post you want to like?")
      if postIndex < posts.count {
        posts[postIndex].addLiker(liker: loggedUser)
      } else {
        print("Post with index \(postIndex) not exist")
      }
    case 6:
      print("----- Log in as different user -----")
      let loggedUserName = promptString(message: "To log in, please tell us your username:")
      if !isUserExist(users: users, userName: loggedUserName) {
        print("You haven't register to instagram! :( Please register first!")
        let newUser = newUserPrompt()
        users[newUser.userName] = newUser
        print()
      }
      loggedUser = getUser(users: users, userName: loggedUserName)
    case 7:
      print("----- Exiting program -----")
      isProgramRunning = false
      print("Bye!")
    default:
      print("Sorry there is no such options :(")
  }
} while isProgramRunning