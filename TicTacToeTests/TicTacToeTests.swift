//
//  TicTacToeTests.swift
//  TicTacToeTests
//
//  Created by 2019_DEV_198 on 29/09/2019.
//  Copyright © 2019 2019_DEV_198. All rights reserved.
//

import XCTest
@testable import TicTacToe

class TicTacToeTests: XCTestCase {
    static let newGame: GameProtocol = Game.newGame
    static let fullGame: GameProtocol = Game.fullGame

    override func setUp() {
    }

    override func tearDown() {
    }

    func testNewGameHasNoWinner() {
        let game = TicTacToeTests.newGame
        XCTAssertNil(game.winner)
    }

    func testNewGameAllowsMove() {
        let game = TicTacToeTests.newGame
        let afterAMove = game.add(move: Move(player: .x, position: 0))
        XCTAssertNotNil(afterAMove)
    }

    func testFullGameDoesntAllowMove() {
        let game = TicTacToeTests.fullGame
        let afterAMove = game.add(move: Move(player: .x, position: 0))
        XCTAssertNil(afterAMove)
    }

}
