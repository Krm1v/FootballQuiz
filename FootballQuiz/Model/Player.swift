//
//  Player.swift
//  FootballQuiz
//
//  Created by Владислав Баранкевич on 23.01.2022.
//

import Foundation

struct Player {
    
    var player: String
    var question: [String]
    var answer: String
    
    init(p: String, q: [String], a: String) {
        player = p
        question = q
        answer = a
    }
}
