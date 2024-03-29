//
//  UIViewExtensions.swift
//  TicTacToe
//
//  Created by 2019_DEV_198 on 30/09/2019.
//  Copyright © 2019 2019_DEV_198. All rights reserved.
//

import UIKit

// MARK: - Translating touches to game position

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

// MARK: - Rendering game state

extension UIView {
    func renderMoves(game: GameProtocol) -> [UIView] {
        let cellSize = CGSize(width: bounds.width / CGFloat(game.width), height: bounds.height / CGFloat(game.height))

        return game.moves.map { (move) in
            let xIndex = move.position % game.width
            let yIndex = Int(move.position / game.width)
            let origin = CGPoint(x: CGFloat(xIndex) * cellSize.width, y: CGFloat(yIndex) * cellSize.height)
            let rect = CGRect(origin: origin, size: cellSize).insetBy(dx: 0.15 * cellSize.width, dy: 0.15 * cellSize.height)

            let moveView = UIImageView(frame: rect)
            switch move.player {
            case .x:
                moveView.image = UIImage(named: "X")
            case .o:
                moveView.image = UIImage(named: "O")
            }
            
            return moveView
        }
    }
    
    func renderGame(_ game: GameProtocol) {
        let moveViews = renderMoves(game: game)
        
        subviews.forEach { $0.removeFromSuperview() }
        moveViews.forEach { self.addSubview($0) }
    }
}

// MARK: - Misc

extension UIView {
    func shake() {
        let animator = UIViewPropertyAnimator(duration: 0.5, dampingRatio: 0.3) {
            self.transform = CGAffineTransform(rotationAngle: 10 * .pi / 180)
        }

        animator.addAnimations({
            self.transform = CGAffineTransform(rotationAngle: -10 * .pi / 180)
        }, delayFactor: 0.1)

        animator.addAnimations({
            self.transform = .identity
        }, delayFactor: 0.2)

        animator.startAnimation()
    }
}
