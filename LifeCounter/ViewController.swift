//
//  ViewController.swift
//  LifeCounter
//
//  Created by Jason Nguyen on 4/21/22.
//

import UIKit

class ViewController: UIViewController {
    var score1 = 20
    @IBOutlet weak var scoreLabel1: UILabel!
    @IBOutlet weak var btn_minusOne1: UIButton!
    @IBOutlet weak var btn_plusOne1: UIButton!
    @IBOutlet weak var btn_minusFive1: UIButton!
    @IBOutlet weak var btn_plusFive1: UIButton!
    
    var score2 = 20
    @IBOutlet weak var scoreLabel2: UILabel!
    @IBOutlet weak var btn_minusOne2: UIButton!
    @IBOutlet weak var btn_plusOne2: UIButton!
    @IBOutlet weak var btn_minusFive2: UIButton!
    @IBOutlet weak var btn_plusFive2: UIButton!
    
    @IBOutlet weak var loserLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        btn_plusOne1.setTitle("+", for: .normal)
        btn_minusOne1.setTitle("-", for: .normal)
        btn_minusFive1.setTitle("-5", for: .normal)
        btn_plusFive1.setTitle("+5", for: .normal)
        scoreLabel1.textAlignment = .center
        loadScore1()
        
        btn_plusOne2.setTitle("+", for: .normal)
        btn_minusOne2.setTitle("-", for: .normal)
        btn_minusFive2.setTitle("-5", for: .normal)
        btn_plusFive2.setTitle("+5", for: .normal)
        scoreLabel2.textAlignment = .center
        loadScore2()
        
        loserLabel.isHidden = true
        loserLabel.textAlignment = .center
        
    }

    @IBAction func btn_minusOne1(_ sender: Any) {
        score1 -= 1
        loadScore1()
        checkIfDead()
    }
    
    @IBAction func btn_plusOne1(_ sender: Any) {
        score1 += 1
        loadScore1()
    }
    
    @IBAction func btn_minusFive1(_ sender: Any) {
        score1 -= 5
        loadScore1()
        checkIfDead()
    }
    
    @IBAction func btn_plusFive1(_ sender: Any) {
        score1 += 5
        loadScore1()
    }
    
    func loadScore1() {
        scoreLabel1.text = "\(score1)"
    }
    
    @IBAction func btn_minusOne2(_ sender: Any) {
        score2 -= 1
        loadScore2()
        checkIfDead()
    }
    
    @IBAction func btn_plusOne2(_ sender: Any) {
        score2 += 1
        loadScore2()
    }
    
    @IBAction func btn_minusFive2(_ sender: Any) {
        score2 -= 5
        loadScore2()
        checkIfDead()
    }
    
    @IBAction func btn_plusFive2(_ sender: Any) {
        score2 += 5
        loadScore2()
    }
    
    func loadScore2() {
        scoreLabel2.text = "\(score2)"
    }
    
    func checkIfDead() {
        if score1 <= 0 {
            showLoser(1)
        }
        if score2 <= 0 {
            showLoser(2)
        }
    }
    
    func showLoser(_ player: Int) {
        loserLabel.isHidden = false
        loserLabel.text = "Player \(player) LOSES!"
    }
    
}

