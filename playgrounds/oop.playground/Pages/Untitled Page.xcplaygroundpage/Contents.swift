import UIKit

class Person {
    var species = "homo sapien"
    var name:String
    
    init(name:String){
        self.name = name
    }
    func speak(){
        print("my species is \(species) and my name is \(name)")
    }
}

var james:Person = Person(name: "james")

james.speak()


//struct Rectangle {
//    var width = 20
//    var height = 10
//
//    func decscription(){
//        print("width is \(width) heigh is \(height)")
//    }
//    mutating func doubleHeight(){
//        height = height*2
//    }
//}
//
//var rec:Rectangle = Rectangle()
//
//print(rec.width)
//
//rec.decscription()
//
//rec.doubleHeight()
//
//rec.decscription()
//
//struct Square {
//    var width = 200
//    var height = 200
//}
//let square = Square()



struct Square {
    var width:Int
    var height:Int
}
let square = Square(width: 30, height: 30)




struct Rectangle {
    var height:Int
    var width:Int
    var size:String
    
    init(height:Int,width:Int) {
        self.height = height
        self.width = width
        
        if width + width <= 10 {
            size = "small"
        }else{
            size = "big"
        }
    }
    
    
}

var rec:Rectangle = Rectangle(height: 30, width: 20)
rec.size


var david = "david"

// david = "david"

var keith = david

// keith = "david"

david = "keith"

print(keith)

class Kite {
    var size:Int
    
    init(size:Int) {
        self.size = size
    }
    func introduce() {
        print("my size is \(self.size)")
    }
    
}

var juice:Kite = Kite(size: 18)
juice.introduce()

var solo = juice

solo.introduce()

solo.size = 30

solo.introduce()
juice.introduce()


// inhertiance


class Person {
  var species = "H. Sapiens"
  var name: String
  init(name: String) {         // Note: this function doesn't get called explicitly.  It is called
                               // when creating an instance using the initialization syntax -- "Person()"
    self.name = name           // Note: the use of "self.name" here to refer to the name property
                               // instead of the name parameter
  }
  func speak() {
    print("Hello! I am a \(self.species) and my name is \(self.name)")
                               // Note how we refer to the properties using "self"
  }
}
class Developer: Person {      // Note how we are specifying that Developer will inherit from Person
  var favoriteLanguage: String
  init(name: String, favoriteLanguage: String) {    // Note there is no override keyword on init because it has
                                                    // different parameter names then the Person init method
    self.favoriteLanguage = favoriteLanguage
    super.init(name: name)
  }
  override func speak() {                           // Note there is an override keyword on speak because it is
                                                    // identical to the Person speak method
    print("Hello! I am a Developer! My name is \(self.name)")
  }
}
var myDeveloper: Developer = Developer(name: "Jay", favoriteLanguage: "Swift")
myDeveloper.speak()

