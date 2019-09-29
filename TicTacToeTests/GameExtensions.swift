//
//  GameExtensions.swift
//  TicTacToeTests
//
//  Created by 2019_DEV_198 on 29/09/2019.
//  Copyright © 2019 2019_DEV_198. All rights reserved.
//

import Foundation
@testable import TicTacToe

extension Game {
    static var newGame = Game()
    static var fullGame = Game(moves: Game.fullBoard)

    static var fullBoard: [Move] {
        return (0..<Game.size).map {
            Move(player: $0 % 2 == 0 ? .x : .o, position: $0)
        }
    }
}
