//
//  Extension + Gradient.swift
//  FootballQuiz
//
//  Created by Владислав Баранкевич on 23.01.2022.
//

import UIKit

extension ViewController {
    func addVerticalGradientLayer(topcolor: UIColor,
                                  bottomColor: UIColor) {
        let gradient = CAGradientLayer()
        gradient.frame = view.bounds
        gradient.colors = [topcolor.cgColor, bottomColor.cgColor]
        gradient.locations = [0.0, 1.0]
        gradient.startPoint = CGPoint(x: 0, y: 0)
        gradient.endPoint = CGPoint(x: 0, y: 1)
        view.layer.insertSublayer(gradient, at: 0)
    }
}
