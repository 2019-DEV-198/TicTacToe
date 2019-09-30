//
//  UIViewControllerExtensions.swift
//  TicTacToe
//
//  Created by 2019_DEV_198 on 30/09/2019.
//  Copyright © 2019 2019_DEV_198. All rights reserved.
//

import UIKit

extension UIViewController {
    func displayGameAlert(message: String) {
        let alert = UIAlertController(title: "Tic-Tac-Toe", message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
        self.present(alert, animated: true)
    }
}
