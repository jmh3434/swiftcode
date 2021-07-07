import UIKit

var greeting = "Hello, playground"


enum BadStuffError: Error { // error type can be extended to our specific case/need
 case Bad
 case Worse
 case Terrible
}


func doUnsafeThings( badStuffHappened: Bool, somethingUnlikely: String? ) throws -> Bool {
 if ( badStuffHappened == true ) {
    throw BadStuffError.Bad
 }
    // if you made it here, you can return:
    return true
}

let badStuffHappened = false
let worseStuffHappened = false
let terribleStuffHappened = false

func doUnsafeStuff() throws -> Bool {
 if badStuffHappened == true {
  throw BadStuffError.Bad
 }
 if worseStuffHappened == true {
  throw BadStuffError.Worse
 }
 if terribleStuffHappened == true {
  throw BadStuffError.Terrible
 }
 return true
}

do {
    try doUnsafeStuff()
}catch{
    print("error")
}




func sum(num1:Int,num2:Int) -> Int? {
    
    guard num1 > 0 else {
        return nil
    }
    return num1 + num2
}

var addition = sum(num1: 1, num2: 20)

