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

    func testTapTranslatesToPosition() {
        let view = UIView(frame: CGRect(x: 0, y: 0, width: 300, height: 300))
        
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
}
