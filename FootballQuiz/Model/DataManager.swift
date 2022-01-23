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
        Player(p: "ronaldo", q: ["Ronaldo", "Neymar", "Messi", "Aguero"], a: "Ronaldo"),
        Player(p: "figo", q: ["Overmars", "Suarez", "Rui Costa", "Figo"], a: "Figo"),
        Player(p: "raul", q: ["Morientes", "Raul", "Suker", "Higuain"], a: "Raul"),
        Player(p: "casillas", q: ["Buffon", "Valdes", "Casillas", "Neuer"], a: "Casillas"),
        Player(p: "carlos", q: ["Marcelo", "Alves", "Maicon", "Roberto Carlos"], a: "Roberto Carlos"),
        Player(p: "beckham", q: ["Beckham", "McManaman", "Bale", "Lampard"], a: "Beckham")
    ]
    
    var questionNumber = 0
    var score = 0
    
//MARK: - Methods
    
    
    
    func getAnswer() -> [String] {
        return quiz[questionNumber].question
    }
    
    func getImage() -> String {
        return quiz[questionNumber].player
    }
    
    func getScore() -> Int {
        return score
    }
    
    func getProgress() -> Float {
        
        let progress = Float(questionNumber + 1) / Float(quiz.count)
        return progress
    }
    
    mutating func checkAnswer(_ userAnswer: String) -> Bool {
        
        if userAnswer == quiz[questionNumber].answer {
            score += 1
            return true
        } else {
            return false
        }
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
