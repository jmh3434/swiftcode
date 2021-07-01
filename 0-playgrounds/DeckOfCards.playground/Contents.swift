import UIKit


struct Card {
    
    var value:String
    var suit:String
    var numerical_value:Int
    
    init(value:String,suit:String,numerical_value:Int){
        self.value = value
        self.suit = suit
        self.numerical_value = numerical_value
    }
}

class Deck {
    let values = ["Ace","Two","Three","Four","Five","Six","Seven","Eight","Nine","Ten","Jack","Queen","King"]
    let suits = ["Clubs","Spades","Diamonds","Hearts"]
    
    var cards = [Card]()
    
    init() {
        buildDeck()
    }
    
    private func buildDeck() {
        for i in 0..<suits.count {
            
            for j in 0..<values.count {
                
                let newCard = Card(value: values[j], suit: suits[i], numerical_value: j)
                
                cards.append(newCard)
            }
        
        }
    }
    func reset() {
        cards = [Card]()
        buildDeck()
    }
    func draw() -> Card? {
        if let removedCardFromDeck = cards.popLast() {
            print(removedCardFromDeck)
            return removedCardFromDeck
        }else {
            return nil
        }
    
    }
    
    func shuffle() {
        for _ in 0..<100 {
            let firstRandomCard = Int.random(in: 0..<cards.count)
            let secondRandomCard = Int.random(in: 0..<cards.count)
            
            let temp = cards[firstRandomCard]
            cards[firstRandomCard] = cards[secondRandomCard]
            cards[secondRandomCard] = temp

        }
    }
}

class Player {
    
    var hand = [Card]()
    
    func draw(fromDeck deck:Deck) {
        
        if let drawnCard = deck.draw() {
            hand.append(drawnCard)
        }else{
            print("out of cards")
        }
    }
    
    func discard(card:Card) -> Bool {
        
        for i in 0..<hand.count {
            
            if (card.suit == hand[i].suit && card.value == hand[i].value) {
                hand.remove(at: i)
                return true
            }
        }
        
        return false
    }
    
}


let deck1 = Deck()

print(deck1.cards.count)

deck1.shuffle()

for card in deck1.cards {
    print(card)
}

var player1:Player = Player()
player1.draw(fromDeck: deck1)
player1.draw(fromDeck: deck1)


 
 
