import Foundation

protocol CardBaseCompatible: Hashable, Codable {
    var suit: Suit {get}
    var value: Value {get}
    var isTrump: Bool {get}

    func hash(into hasher: inout Hasher)
}

enum Suit: Int, CaseIterable, Codable {
    case clubs
    case spades
    case hearts
    case diamonds
}

enum Value: Int, Codable {
    case six
    case seven
    case eight
    case nine
    case ten
    case jack
    case queen
    case king
    case ace
}

struct Card: CardBaseCompatible {
    let suit: Suit
    let value: Value
    var isTrump: Bool = false

    func hash(into hasher: inout Hasher) {

    }

    static func == (lhs: Self, rhs: Self) -> Bool {
        return  (lhs.suit == rhs.suit) && (lhs.value == rhs.value) &&
                (lhs.isTrump == rhs.isTrump) && (lhs.hashValue == rhs.hashValue)
    }
}

extension Card {

    func checkIfCanBeat(card: Card) -> Bool {
        
        return checkValue(card: card)
    }
    

    func checkValue(card: Card) -> Bool {
        if (isTrump == false) && (card.isTrump == true) {
            return false
        }
        if (isTrump == true) && (card.isTrump == false) {
            return true
        }
        if (isTrump == true) && (card.isTrump == true) {
            if value.rawValue > card.value.rawValue {
                return true
            } else {
                return false
            }
        }
        if (isTrump == false) && (card.isTrump == false) {
            if value.rawValue > card.value.rawValue {
                return true
            } else {
                return false
            }
        }
        return true
    }
}
