//
//  ViewController.swift
//  Gradient and Shadow
//
//  Created by Artyom on 01.11.2023.
//

import UIKit

class ViewController: UIViewController {
    
    let square = UIView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // - Закруглить края.
        square.layer.cornerRadius = 10
        
        // - Покрасить градиентом.
        let gradientLayer = CAGradientLayer()
        gradientLayer.startPoint = CGPoint(x: 0, y: 0)
        gradientLayer.endPoint = CGPoint(x: 1, y: 1)
        gradientLayer.colors = [UIColor.systemBlue.cgColor, UIColor.systemRed.cgColor]
        gradientLayer.frame = .init(x: 0, y: 0, width: 100, height: 100)
        gradientLayer.cornerRadius = 10
        square.layer.insertSublayer(gradientLayer, at: 0)
        
        // - Установить тень.
        square.layer.shadowOpacity = 0.5
        square.layer.shadowOffset = .init(width: 5, height: 5)
        
        view.addSubview(square)

        square.translatesAutoresizingMaskIntoConstraints = false
        // - Вью всегда по центру по вертикали и 100pt от левого края.
        NSLayoutConstraint.activate([
            square.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 100),
            square.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            square.widthAnchor.constraint(equalToConstant: 100),
            square.heightAnchor.constraint(equalToConstant: 100)
        ])
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        if let gradientLayer = square.layer.sublayers?.first as? CAGradientLayer {
            gradientLayer.frame = square.bounds
        }
    }
}

