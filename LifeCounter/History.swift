//
//  History.swift
//  LifeCounter
//
//  Created by Jason Nguyen on 4/26/22.
//

import Foundation
import UIKit

class History: UIViewController {
    
    let gameMessages = UIStackView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        createDismissButton()
        createGameMessages()
        
//        for i in 0...gameHistory.count - 1 {
//            let thing = UILabel()
//            thing.text = gameHistory[i]
//            gameMessages.addArrangedSubview(thing)
//        }
        
    }
    
    func createDismissButton() {
        let button = UIButton()
        button.backgroundColor = UIColor.blue
        button.setTitle("dismiss", for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self, action: #selector(handleDismiss(_:)), for: .touchUpInside)
        self.view.addSubview(button)
        
        button.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true
        button.centerYAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.bottomAnchor, constant: -20).isActive = true
    }
    
    @objc func handleDismiss(_ sender: UIButton) {
        self.dismiss(animated: true)
    }
    
    func createGameMessages() {
        gameMessages.axis  = NSLayoutConstraint.Axis.vertical
        gameMessages.distribution  = UIStackView.Distribution.equalSpacing
        gameMessages.alignment = UIStackView.Alignment.center
        gameMessages.spacing   = 2.0
        gameMessages.translatesAutoresizingMaskIntoConstraints = false
        
        self.view.addSubview(gameMessages)
        
        gameMessages.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true
        gameMessages.centerYAnchor.constraint(equalTo: self.view.centerYAnchor).isActive = true
        
    }
    
}
