import Foundation

protocol DeckBaseCompatible: Codable {
    var cards: [Card] {get set}
    var type: DeckType {get}
    var total: Int {get}
    var trump: Suit? {get}
}

enum DeckType:Int, CaseIterable, Codable {
    case deck36 = 36
}

struct Deck: DeckBaseCompatible {

    //MARK: - Properties

    var cards = [Card]()
    var type: DeckType
    var trump: Suit?

    var total:Int {
        return type.rawValue
    }
}

extension Deck {

    init(with type: DeckType) {
        self.type = type
            self.cards = createDeck(
                suits: [.clubs,.spades,.hearts,.diamonds],
                values: [.six,.seven,.eight,.nine,.ten,.jack,.queen,.king,.ace])
    }

    public func createDeck(suits:[Suit], values:[Value]) -> [Card] {
       var result = [Card]()
        for i in suits {
            for j in values {
                let temp = Card(suit: i, value: j, isTrump: false)
                result.append(temp)
            }
        }
        return result
    }

    public mutating func shuffle() {
        let temp = cards.shuffled()
        cards = temp
    }

    public mutating func defineTrump() {
        self.trump = cards.last!.suit // первая или последняя?????
        setTrumpCards(for: trump!)
    }

    public mutating func initialCardsDealForPlayers(players: [Player]) {
        guard players.count > 0 && players.count <= 6 else { return }
        var temp = cards
        
        for i in players {
            if i.hand == nil { i.hand = [Card]() }
            guard i.hand!.count < 6 else { continue }
            for _ in 1...6 {
                let k = temp.remove(at: 0)
                i.hand!.append(k)
            }
        }
        cards = temp
    }

    public mutating func setTrumpCards(for suit:Suit) {
        for i in 0..<cards.count {
            if cards[i].suit == suit {
                cards[i].isTrump = true
            }
        }
    }
}

