//
//  Game.swift
//  DurakGame
//
//  Created by Дима Носко on 16.06.21.
//

import Foundation

protocol GameCompatible {
    var players: [Player] { get set }
}

struct Game: GameCompatible {
    var players: [Player]
}

extension Game {

    func defineFirstAttackingPlayer(players: [Player]) -> Player? {
        var resultPlayer: Player?
        var minimal: Card?
        
        for i in players {
            if let player = i.hand {
                for card in player where card.isTrump == true {
                    if card.value.rawValue < minimal?.value.rawValue ?? 9 {
                        resultPlayer = i
                        minimal = card
                    }
                }
            }
        }
        return resultPlayer
    }

}
