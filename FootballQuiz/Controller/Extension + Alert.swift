//
//  Extension + Alert.swift
//  FootballQuiz
//
//  Created by Владислав Баранкевич on 23.01.2022.
//

import UIKit

extension ViewController {
    
    func showAlert() {
        
        let alert = UIAlertController(title: "Your score: \(player.getScore())",
                                      message: "",
                                      preferredStyle: .alert)
        let action = UIAlertAction(title: "Play again",
                                   style: .default) { _ in
            self.showUI()
        }
        alert.addAction(action)
        present(alert, animated: true, completion: nil)
    }
}
