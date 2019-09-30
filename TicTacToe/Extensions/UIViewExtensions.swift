//
//  UIViewExtensions.swift
//  TicTacToe
//
//  Created by 2019_DEV_198 on 30/09/2019.
//  Copyright © 2019 2019_DEV_198. All rights reserved.
//

import UIKit

extension UIView {
    func gamePosition(for location: CGPoint, sizeX: Int, sizeY: Int) -> Int? {
        guard bounds.contains(location) else {
            return nil
        }

        let x = Int(location.x / (bounds.width / CGFloat(sizeX)))
        let y = Int(location.y / (bounds.height / CGFloat(sizeY)))
        
        return y * sizeX + x
    }
    
    func gamePosition(for tap: UITapGestureRecognizer, sizeX: Int, sizeY: Int) -> Int? {
        return gamePosition(for: tap.location(in: self), sizeX: sizeX, sizeY: sizeY)
    }
}
