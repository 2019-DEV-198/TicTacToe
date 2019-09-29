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
    static var size = Game.width * Game.height
    static let wins = [
        Set([0, 1, 2]), 
        Set([3, 4, 5]),
        Set([6, 7, 8]),
        Set([0, 3, 6]),
        Set([1, 4, 7]),
        Set([2, 5, 8]),
        Set([0, 4, 8]),
        Set([2, 4, 6]),
    ]
    
    private let moves: [Move]
    private let gameWinner: Player?
    
    init() {
        moves = []
        gameWinner = Game.checkWinner(moves: moves)
    }
    
    init(moves: [Move]) {
        self.moves = moves
        gameWinner = Game.checkWinner(moves: moves)
    }
    
    private static func checkWinner(moves: [Move]) -> Player? {
        return Player.all.first(where: { (player) in
            let playerMoves = moves.filter({ $0.player == player }).map({ $0.position })

            return wins.contains(where: { (win) in
                win.isSubset(of: playerMoves)
            })
        })
    }
}

extension Game: GameProtocol {
    var winner: Player? {
        return gameWinner
    }
    
    var isComplete: Bool {
        return winner != nil || moves.count >= Game.size
    }
    
    func add(move: Move) -> Game? {
        guard !isComplete,
            moves.last?.player ?? .o != move.player,
            !moves.contains(where: { $0.position == move.position })
            else {
            return nil
        }
        
        return Game(moves: moves + [move])
    }
}
