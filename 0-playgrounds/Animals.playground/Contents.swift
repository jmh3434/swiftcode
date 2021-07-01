import UIKit

class Animal {
    var name:String
    var health:Int = 100
    
    init(name:String) {
        self.name = name
    }
    func displayHealth() {
        print("the health of animal \(name) is \(health)")
    }
}

class Cat:Animal {

    override init(name:String) {
        super.init(name: name)
        health = 150
    }
    func growl() {
        print("Rawr!")
    }
    func run(){
        print("running")
        health -= 10
    }
}

class Cheetah:Cat {
    
    override func run() {
        
        
        if health < 0 {
            print("can't run anymore")
        }else{
            print("running fast")
            health -= 50
        }
        
    }
    
}

class Lion:Cat {
    
    override init(name: String) {
        super.init(name: name)
        
        health = 200
    }
    override func growl() {
        print("ROAR!!!! I am the King of the Jungle")
    }
    
}


let cheeta:Cheetah = Cheetah(name: "mr cheeta")

cheeta.displayHealth()
cheeta.run()
cheeta.displayHealth()

let lion:Lion = Lion(name: "king of the jungle")

lion.run()
lion.growl()
