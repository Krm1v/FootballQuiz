//
//  ViewController.swift
//  FootballQuiz
//
//  Created by Владислав Баранкевич on 23.01.2022.
//

import UIKit

class ViewController: UIViewController {

//MARK: - @IBOutlets
    
    @IBOutlet weak var progressBar: UIProgressView!
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var firstButton: UIButton!
    @IBOutlet weak var secondButton: UIButton!
    @IBOutlet weak var thirdButton: UIButton!
    @IBOutlet weak var fourthButton: UIButton!
    
//MARK: - Properties
    
    var player = DataManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateUI()
    }

    @IBAction func answerButtonPressed(_ sender: UIButton) {
        player.nextQuestion()
    }
    
    private func updateUI() {
        let answerChoise = player.getAnswer()
        firstButton.setTitle(answerChoise[0], for: .normal)
        secondButton.setTitle(answerChoise[1], for: .normal)
        thirdButton.setTitle(answerChoise[2], for: .normal)
        fourthButton.setTitle(answerChoise[3], for: .normal)
        imageView.image = UIImage(imageLiteralResourceName: player.getImage())
    }
    
}

