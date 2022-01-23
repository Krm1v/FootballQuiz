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
    let primaryColor = UIColor(red: 187/255, green: 141/255, blue: 246/255, alpha: 1)
    let secondaryColor = UIColor(red: 85/255, green: 37/255, blue: 134/255, alpha: 1)
        
    override func viewDidLoad() {
        super.viewDidLoad()
        addVerticalGradientLayer(topcolor: primaryColor, bottomColor: secondaryColor)
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
        
        if player.questionNumber == player.quiz.count - 1 {
            hideUI()
            showAlert()
        } else {
            showUI()
        }
        
        Timer.scheduledTimer(timeInterval: 0.2,
                             target: self,
                             selector: #selector (updateUI),
                             userInfo: nil,
                             repeats: false)
        
        player.nextQuestion()
    }
    
    //MARK: - Methods
    
    @objc func updateUI() {
        let answerChoise = player.getAnswer()
        firstButton.setTitle(answerChoise[0], for: .normal)
        secondButton.setTitle(answerChoise[1], for: .normal)
        thirdButton.setTitle(answerChoise[2], for: .normal)
        fourthButton.setTitle(answerChoise[3], for: .normal)
        imageView.image = UIImage(imageLiteralResourceName: player.getImage())
        navigationController?.navigationBar.titleTextAttributes = [.foregroundColor : #colorLiteral(red: 0.6, green: 0.9960784314, blue: 1, alpha: 1)]
        title = "Score: \(player.getScore())"
        progressBar.progress = player.getProgress()
        
        firstButton.backgroundColor = #colorLiteral(red: 0.5803921569, green: 0.7019607843, blue: 0.9921568627, alpha: 1)
        secondButton.backgroundColor = #colorLiteral(red: 0.5803921569, green: 0.7019607843, blue: 0.9921568627, alpha: 1)
        thirdButton.backgroundColor = #colorLiteral(red: 0.5803921569, green: 0.7019607843, blue: 0.9921568627, alpha: 1)
        fourthButton.backgroundColor = #colorLiteral(red: 0.5803921569, green: 0.7019607843, blue: 0.9921568627, alpha: 1)
    }
    
    private func hideUI() {
        imageView.isHidden = true
        firstButton.isHidden = true
        secondButton.isHidden = true
        thirdButton.isHidden = true
        fourthButton.isHidden = true
        progressBar.isHidden = true
    }
    
    func showUI() {
        imageView.isHidden = false
        firstButton.isHidden = false
        secondButton.isHidden = false
        thirdButton.isHidden = false
        fourthButton.isHidden = false
        progressBar.isHidden = false
    }
    
}
