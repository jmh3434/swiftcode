import UIKit

class Person {
  var species = "H. Sapiens"
  var name: String
  init(name: String) {         // Note: this function doesn't get called explicitly.  It is called
                               // when creating an instance using the initialization syntax -- "Person()"
    self.name = name           // Note: the use of "self.name" here to refer to the name property
    // instead of the name parameter
  }
  func speak() -> Self {
    print("Hello! I am a \(self.species) and my name is \(self.name)")
                               // Note how we refer to the properties using "self"
    return self
  }
}


class Developer: Person {
    var favoriteLanguage:String
    
    init(name:String, favoriteLanguage:String) {
        self.favoriteLanguage = favoriteLanguage
        
        super.init(name: name)
    }
    
    override func speak() -> Self {
        print("I'm a developer named \(self.name)")
        return self
    }
    

    
}

class Athlete: Person {
    var favoriteLangugage: String
    
    init(name: String, favoriteLanguage:String) {
    
        self.favoriteLangugage = favoriteLanguage
        
        super.init(name: name)
    }
    override func speak() -> Self {
        print("I'm an athlete named \(self.name)")
        return self
    }
    func run(){
        print("running")
    }
}

var james:Developer = Developer(name: "James Hunt", favoriteLanguage: "Swift")

var athlete:Athlete = Athlete(name: "Matthew", favoriteLanguage: "Java")

athlete.speak().run()
