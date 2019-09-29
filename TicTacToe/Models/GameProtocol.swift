//
//  GameProtocol.swift
//  TicTacToe
//
//  Created by 2019_DEV_198 on 29/09/2019.
//  Copyright © 2019 2019_DEV_198. All rights reserved.
//

import Foundation

protocol GameProtocol {
    var winner: Player? { get }
    var isComplete: Bool { get }
    func add(move: Move) -> Self
}
