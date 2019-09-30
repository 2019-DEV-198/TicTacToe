//
//  UIViewTests.swift
//  TicTacToeTests
//
//  Created by 2019_DEV_198 on 30/09/2019.
//  Copyright © 2019 2019_DEV_198. All rights reserved.
//

import XCTest
@testable import TicTacToe

class UIViewTests: XCTestCase {
    var view: UIView!
    
    override func setUp() {
        view = UIView(frame: CGRect(x: 0, y: 0, width: 300, height: 300))
    }

    func testTapTranslatesToPosition() {
        let position0 = view.gamePosition(for: CGPoint(x: 0, y: 0), sizeX: Game.width, sizeY: Game.height)
        XCTAssertEqual(position0, 0)

        let position1 = view.gamePosition(for: CGPoint(x: 150, y: 50), sizeX: Game.width, sizeY: Game.height)
        XCTAssertEqual(position1, 1)

        let position2 = view.gamePosition(for: CGPoint(x: 299, y: 99), sizeX: Game.width, sizeY: Game.height)
        XCTAssertEqual(position2, 2)

        let position3 = view.gamePosition(for: CGPoint(x: 0, y: 150), sizeX: Game.width, sizeY: Game.height)
        XCTAssertEqual(position3, 3)

        let position4 = view.gamePosition(for: CGPoint(x: 150, y: 150), sizeX: Game.width, sizeY: Game.height)
        XCTAssertEqual(position4, 4)

        let position5 = view.gamePosition(for: CGPoint(x: 299, y: 150), sizeX: Game.width, sizeY: Game.height)
        XCTAssertEqual(position5, 5)

        let position6 = view.gamePosition(for: CGPoint(x: 50, y: 250), sizeX: Game.width, sizeY: Game.height)
        XCTAssertEqual(position6, 6)

        let position7 = view.gamePosition(for: CGPoint(x: 150, y: 201), sizeX: Game.width, sizeY: Game.height)
        XCTAssertEqual(position7, 7)

        let position8 = view.gamePosition(for: CGPoint(x: 299, y: 299), sizeX: Game.width, sizeY: Game.height)
        XCTAssertEqual(position8, 8)

        let outside = view.gamePosition(for: CGPoint(x: 0, y: 400), sizeX: Game.width, sizeY: Game.height)
        XCTAssertNil(outside)
    }
    
    func testNewGameRendersNoSubviews() {
        let newGame = TicTacToeTests.newGame
        let subviews = view.renderMoves(game: newGame)
        XCTAssertTrue(subviews.isEmpty)
    }
    
    func testMovesRenderToSubviews() {
        guard let game = TicTacToeTests.newGame
            .add(move: Move(player: .x, position: 0))?
            .add(move: Move(player: .o, position: 4))?
            .add(move: Move(player: .x, position: 8)) else {
                XCTFail()
                return
        }

        let positions = getPositionsFromRenderedGame(game)
        XCTAssertEqual(positions, [0, 4, 8])
    }

    func testFullGameRendersToSubviews() {
        let positions = getPositionsFromRenderedGame(TicTacToeTests.fullGame)
        XCTAssertEqual(positions, [0, 1, 2, 3, 4, 5, 6, 7, 8])
    }

    private func getPositionsFromRenderedGame(_ game: GameProtocol) -> [Int] {
        let subviews = view.renderMoves(game: game)
        
        return subviews.compactMap {
            guard let position = view.gamePosition(for: $0.center, sizeX: Game.width, sizeY: Game.height) else {
                    return nil
            }
            
            return position
        }
    }
}
