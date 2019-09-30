//
//  Player.swift
//  TicTacToe
//
//  Created by 2019_DEV_198 on 29/09/2019.
//  Copyright © 2019 2019_DEV_198. All rights reserved.
//

import Foundation

enum Player {
    case x
    case o
    
    var next: Player {
        switch self {
        case .x:
            return .o
        case .o:
            return .x
        }
    }
    
    static var all: [Player] {
        return [.x, .o]
    }

}

extension Player {
    // dummy method to ensure potential new Player cases are not missing in Player.all
    private static func assertAllPropertyIsExhaustive() {
        all.forEach {
            switch $0 {
            case x:
                break
            case o:
                break
            }
        }
    }
}
