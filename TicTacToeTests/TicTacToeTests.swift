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
    
    func testXGoesFirst() {
        let game = TicTacToeTests.newGame
        let xMoves = game.add(move: Move(player: .x, position: 0))
        let oMoves = game.add(move: Move(player: .o, position: 0))
        
        XCTAssertNotNil(xMoves)
        XCTAssertNil(oMoves)
    }

    func testMoveNotAllowedOnPlayedPosition() {
        let game = TicTacToeTests.newGame
        let afterMove = game.add(move: Move(player: .x, position: 0))
        let afterSameMove = afterMove?.add(move: Move(player: .o, position: 0))
        
        XCTAssertNotNil(afterMove)
        XCTAssertNil(afterSameMove)
    }
    
    func testPlayersAlternateMoves() {
        let xMoves = TicTacToeTests.newGame.add(move: Move(player: .x, position: 0))
        let xMovesAgain = xMoves?.add(move: Move(player: .x, position: 1))
        let oMovesThen = xMoves?.add(move: Move(player: .o, position: 1))
        let oMovesAgain = oMovesThen?.add(move: Move(player: .o, position: 2))
        let xMovesThen = oMovesThen?.add(move: Move(player: .x, position: 2))

        XCTAssertNil(xMovesAgain)
        XCTAssertNotNil(oMovesThen)
        XCTAssertNil(oMovesAgain)
        XCTAssertNotNil(xMovesThen)
    }
    
    func testDrawGameIsComplete() {
        guard let drawGame = TicTacToeTests.newGame
            .add(move: Move(player: .x, position: 4))?
            .add(move: Move(player: .o, position: 0))?
            .add(move: Move(player: .x, position: 2))?
            .add(move: Move(player: .o, position: 6))?
            .add(move: Move(player: .x, position: 8))?
            .add(move: Move(player: .o, position: 5))?
            .add(move: Move(player: .x, position: 1))?
            .add(move: Move(player: .o, position: 7))?
            .add(move: Move(player: .x, position: 3)) else {
            XCTFail()
            return
        }

        XCTAssertNil(drawGame.winner)
        XCTAssertTrue(drawGame.isComplete)
    }
}
