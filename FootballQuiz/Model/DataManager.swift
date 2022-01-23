//
//  DataManager.swift
//  FootballQuiz
//
//  Created by Владислав Баранкевич on 23.01.2022.
//

import Foundation

struct DataManager {
    
    let quiz = [
        Player(p: "modric", q: ["Rivaldo", "Salah", "Werner", "Modric"], a: "Modric"),
        Player(p: "zidane", q: ["Henry", "Vieri", "Zidane", "Larsson"], a: "Zidane"),
        Player(p: "ronaldo", q: ["Ronaldo", "Neymar", "Messi", "Aguero"], a: "Ronaldo")
    ]
    
    var questionNumber = 0
    var score = 0
    
    mutating func checkAnswer(_ userAnswer: String) -> Bool {
        
        if userAnswer == quiz[questionNumber].answer {
            return true
        } else {
            return false
        }
    }
    
    func getAnswer() -> [String] {
        return quiz[questionNumber].question
    }
    
    func getImage() -> String {
        return quiz[questionNumber].player
    }
    
    mutating func nextQuestion() {
        if questionNumber + 1 < quiz.count {
            questionNumber += 1
        } else {
            questionNumber = 0
            score = 0
        }
    }
}
