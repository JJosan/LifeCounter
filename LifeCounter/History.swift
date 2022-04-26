//
//  History.swift
//  LifeCounter
//
//  Created by Jason Nguyen on 4/26/22.
//

import Foundation
import UIKit

class History: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        createDismissButton()
        
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
    
}
