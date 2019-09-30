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
        
        let position0 = view.gamePosition(for: CGPoint(x: 0, y: 0))
        XCTAssertEqual(position0, 0)

        let position1 = view.gamePosition(for: CGPoint(x: 150, y: 50))
        XCTAssertEqual(position1, 0)

        let position2 = view.gamePosition(for: CGPoint(x: 300, y: 99))
        XCTAssertEqual(position2, 0)

        let position3 = view.gamePosition(for: CGPoint(x: 0, y: 150))
        XCTAssertEqual(position3, 0)

        let position4 = view.gamePosition(for: CGPoint(x: 150, y: 150))
        XCTAssertEqual(position4, 0)

        let position5 = view.gamePosition(for: CGPoint(x: 300, y: 150))
        XCTAssertEqual(position5, 0)

        let position6 = view.gamePosition(for: CGPoint(x: 50, y: 250))
        XCTAssertEqual(position6, 0)

        let position7 = view.gamePosition(for: CGPoint(x: 150, y: 201))
        XCTAssertEqual(position7, 0)

        let position8 = view.gamePosition(for: CGPoint(x: 300, y: 300))
        XCTAssertEqual(position8, 0)

        let outside = view.gamePosition(for: CGPoint(x: 0, y: 400))
        XCTAssertNil(outside)
    }
}
