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

//MARK: - @IBAction
    
    @IBAction func answerButtonPressed(_ sender: UIButton) {
        guard let userAnswer = sender.currentTitle else { return }
        let userWasRight = player.checkAnswer(userAnswer)
        
        if userWasRight {
            sender.backgroundColor = #colorLiteral(red: 0.5803921569, green: 0.7019607843, blue: 0.9921568627, alpha: 1)
        } else {
            sender.backgroundColor = .red
        }
        
        Timer.scheduledTimer(timeInterval: 0.2,
                             target: self,
                             selector: #selector (updateUI),
                             userInfo: nil,
                             repeats: false)
        
        player.nextQuestion()
     
    }
    
//MARK: - Methods
    
    @objc private func updateUI() {
        let answerChoise = player.getAnswer()
        firstButton.setTitle(answerChoise[0], for: .normal)
        secondButton.setTitle(answerChoise[1], for: .normal)
        thirdButton.setTitle(answerChoise[2], for: .normal)
        fourthButton.setTitle(answerChoise[3], for: .normal)
        imageView.image = UIImage(imageLiteralResourceName: player.getImage())
        
        firstButton.backgroundColor = #colorLiteral(red: 0.5803921569, green: 0.7019607843, blue: 0.9921568627, alpha: 1)
        secondButton.backgroundColor = #colorLiteral(red: 0.5803921569, green: 0.7019607843, blue: 0.9921568627, alpha: 1)
        thirdButton.backgroundColor = #colorLiteral(red: 0.5803921569, green: 0.7019607843, blue: 0.9921568627, alpha: 1)
        fourthButton.backgroundColor = #colorLiteral(red: 0.5803921569, green: 0.7019607843, blue: 0.9921568627, alpha: 1)
    }
}

