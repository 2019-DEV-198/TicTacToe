//
//  ViewController.swift
//  TicTacToe
//
//  Created by 2019_DEV_198 on 29/09/2019.
//  Copyright © 2019 2019_DEV_198. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var gameView: UIView!
    @IBOutlet weak var xButton: UIButton!
    @IBOutlet weak var oButton: UIButton!
    
    var game: GameProtocol = Game()
    
    var nextPlayer = Player.x {
        didSet {
            xButton.isSelected = nextPlayer == .x
            oButton.isSelected = nextPlayer == .o
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        nextPlayer = .x
        configureGestures()
    }
    
    private func configureGestures() {
        let tap = UITapGestureRecognizer(target: self, action: #selector(tapOnBoard(tap:)))
        gameView.addGestureRecognizer(tap)
    }

    @objc private func tapOnBoard(tap: UITapGestureRecognizer) {
        guard let position = gameView.gamePosition(for: tap, sizeX: game.width, sizeY: game.height) else {
            return
        }
        
        attempt(move: Move(player: nextPlayer, position: position))
    }

    private func attempt(move: Move) {
        print("\(move.player) moves in position \(move.position)")
    }
    
    @IBAction func xSelected(_ sender: Any) {
        nextPlayer = .x
    }
    
    @IBAction func oSelected(_ sender: Any) {
        nextPlayer = .o
    }
}
