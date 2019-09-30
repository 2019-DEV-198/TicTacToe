//
//  ViewController.swift
//  TicTacToe
//
//  Created by 2019_DEV_198 on 29/09/2019.
//  Copyright © 2019 2019_DEV_198. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    private let queue = DispatchQueue(label: "com.2019-DEV-198.TicTacToe")

    @IBOutlet weak var gameView: UIView!
    @IBOutlet weak var xButton: UIButton!
    @IBOutlet weak var oButton: UIButton!
    
    var game: GameProtocol = Game() {
        didSet {
            updateBoard()
            checkIfComplete()
        }
    }
    
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
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        updateBoard()
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

    @IBAction func xSelected(_ sender: Any) {
        nextPlayer = .x
    }
    
    @IBAction func oSelected(_ sender: Any) {
        nextPlayer = .o
    }
    
    @IBAction func reset(_ sender: Any) {
        game = Game()
        nextPlayer = .x
    }
    
    // MARK: -
    
    private func attempt(move: Move) {
        queue.async { [weak self] in
            guard let afterMove = self?.game.add(move: move) else {
                DispatchQueue.main.async {
                    self?.invalidMove()
                }
                return
            }
            
            DispatchQueue.main.async {
                self?.game = afterMove
                self?.nextPlayer = move.player.next
            }
        }
    }
    
    private func updateBoard() {
        gameView.renderGame(game)
    }

    private func checkIfComplete() {
        guard game.isComplete else {
            return
        }
        
        guard let winner = game.winner else {
            self.displayGameAlert(message: "It's a draw.")
            return
        }
        
        self.displayGameAlert(message: "\(winner.name) won!")
    }
    
    private func invalidMove() {
        print("Invalid move!")
    }
}
