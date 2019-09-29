//
//  Game.swift
//  TicTacToe
//
//  Created by 2019_DEV_198 on 29/09/2019.
//  Copyright © 2019 2019_DEV_198. All rights reserved.
//

import Foundation

struct Game {
    static let width = 3
    static let height = 3
    static let win = 3
    
    let moves: [Move]
    let winner: Player?
    
    init() {
        moves = []
        winner = nil
    }
}
