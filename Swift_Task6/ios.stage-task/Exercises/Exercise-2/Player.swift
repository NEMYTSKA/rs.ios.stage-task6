//
//  Player.swift
//  DurakGame
//
//  Created by Дима Носко on 15.06.21.
//

import Foundation

protocol PlayerBaseCompatible {
    var hand: [Card]? { get set }
}

final class Player: PlayerBaseCompatible {
    var hand: [Card]?

    func checkIfCanTossWhenAttacking(card: Card) -> Bool {
        guard hand != nil else { return false }
        for i in hand! where i.value == card.value {
//            if i.value == card.value {
                return true
//            }
        }
        return false
    }

    func checkIfCanTossWhenTossing(table: [Card: Card]) -> Bool {
        for (key,_) in table {
           for i in hand! where i.value == key.value {
            return true
            }
        }
        return false
    }
}
