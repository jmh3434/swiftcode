import UIKit

var greeting = "Hello, playground"

var numbers:[Int] = [1,2,3,4]
for var value in numbers {
    value += 3
    print(value)
}
print(numbers)



func tossCoin() -> String {
    let headstails = Int.random(in: 0...1)
    
    if headstails == 0 {
        return "heads"
    }else{
        return "tails"
    }
}

tossCoin()


func totalHeads(numTosses:Int) -> Double {
    var heads = 0
    
    for _ in 1...numTosses {
        let headstails = Int.random(in: 0...1)
        
        if headstails == 0 {
            heads+=1
        }
    }
    
    return Double(heads)/Double(numTosses)
}


var ratio = totalHeads(numTosses: 20)

print(ratio)
 

class Person {
  var species = "H. Sapiens"
}
var myPerson: Person = Person()
print(myPerson.species)

