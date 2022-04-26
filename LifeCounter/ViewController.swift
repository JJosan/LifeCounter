//
//  ViewController.swift
//  LifeCounter
//
//  Created by Jason Nguyen on 4/21/22.
//

import UIKit
import Foundation


class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        addPlayersButton()
        showPlayers()
        makeChungusButton()
    }
    
    // create player
    class Player {
        let id : Int
        var name : String
        var score : Int = 20
        
        var nameLabel : UILabel
        let minusX : UIButton
        let minus1 : UIButton
        let plus1 : UIButton
        let plusX : UIButton
        var scoreLabel : UILabel
        
        init(_ name : String, _ id : Int) {
            self.name = name
            self.id = id
            
            nameLabel = UILabel()
            nameLabel.text = name
            nameLabel.isUserInteractionEnabled = true
            nameLabel.tag = id
            
            minusX = UIButton()
            minusX.backgroundColor = UIColor.blue
            minusX.setTitle("-5", for: .normal)
            minusX.tag = id
            
            minus1 = UIButton()
            minus1.backgroundColor = UIColor.blue
            minus1.setTitle("-", for: .normal)
            minus1.tag = id
            
            plus1 = UIButton()
            plus1.backgroundColor = UIColor.blue
            plus1.setTitle("+", for: .normal)
            plus1.tag = id
            
            plusX = UIButton()
            plusX.backgroundColor = UIColor.blue
            plusX.setTitle("+5", for: .normal)
            plusX.tag = id
            
            scoreLabel = UILabel()
            scoreLabel.text = "\(self.score)"
            scoreLabel.tag = id
        }
    }
    
    // change big damage button
    
    
    // add player button
    let addPlayerButton = UIButton()
    
    // initialize stackview as global variable
    let stackView = UIStackView()
    
    // initialize total starting players
    var totalPlayers = 2
    
    // X
    var bigChungus = 5
    
    // array to hold all the players
    var allPlayers : [Player] = []
    
    func addPlayer(_ newPlayer : Player) -> Player {
        // create horizontal stackview to hold all the buttons
        // and stuff with the settings i found on the internet
        let group = UIStackView()
        group.axis  = NSLayoutConstraint.Axis.horizontal
        group.distribution  = UIStackView.Distribution.equalSpacing
        group.alignment = UIStackView.Alignment.center
        group.spacing   = 2.0
        group.translatesAutoresizingMaskIntoConstraints = false
        
        // put handlers onto the player buttons and labels
        let tap = UITapGestureRecognizer(target: self, action: #selector(handleNameChange(_:)))
        newPlayer.nameLabel.addGestureRecognizer(tap)
        newPlayer.minusX.addTarget(self, action: #selector(handleMinusX(_:)), for: .touchUpInside)
        newPlayer.minus1.addTarget(self, action: #selector(handleMinus1(_:)), for: .touchUpInside)
        newPlayer.plus1.addTarget(self, action: #selector(handlePlus1(_:)), for: .touchUpInside)
        newPlayer.plusX.addTarget(self, action: #selector(handlePlusX(_:)), for: .touchUpInside)
        
        // add the player buttons and labels into the group
        group.addArrangedSubview(newPlayer.nameLabel)
        group.addArrangedSubview(newPlayer.minusX)
        group.addArrangedSubview(newPlayer.minus1)
        group.addArrangedSubview(newPlayer.scoreLabel)
        group.addArrangedSubview(newPlayer.plus1)
        group.addArrangedSubview(newPlayer.plusX)
        
        // add group to main stackview
        stackView.addArrangedSubview(group)
        
        return newPlayer
    }
    
    @objc func handleNameChange(_ sender: UIGestureRecognizer) {
        print(sender.view!.tag)
        let player = allPlayers[sender.view!.tag]
        
        // do something with input fields to change this value later
        player.name = "new name"
        player.nameLabel.text = player.name
    }
    
    
    @objc func handleMinusX(_ sender: UIButton) {
        let player = allPlayers[sender.tag]
        player.score -= bigChungus
        rerenderScore(player)
        checkForDeath(player)
        disableAddPlayer()
    }
    
    @objc func handleMinus1(_ sender: UIButton) {
        let player = allPlayers[sender.tag]
        player.score -= 1
        rerenderScore(player)
        checkForDeath(player)
        disableAddPlayer()
    }
    
    @objc func handlePlus1(_ sender: UIButton) {
        let player = allPlayers[sender.tag]
        player.score += 1
        rerenderScore(player)
        disableAddPlayer()
    }
    
    @objc func handlePlusX(_ sender: UIButton) {
        let player = allPlayers[sender.tag]
        player.score += bigChungus
        rerenderScore(player)
        disableAddPlayer()
    }
    @objc func handleAddingPlayers(_ sender: UIButton) {
        
        // if there are already 5 players, can't add more
        // there isn't enough space on the small devices for 8 players
        if totalPlayers == 5 { return }
        totalPlayers += 1
        allPlayers.append(addPlayer(Player("Player \(totalPlayers)", totalPlayers - 1)))
    }
    
    @objc func changeChungus(_ sender: UIButton) {
        
        // do something to get a user value
        bigChungus = 10
        
        // for loop to change all the labels
        for i in 0...allPlayers.count - 1 {
            allPlayers[i].minusX.setTitle("-\(bigChungus)", for: .normal)
            allPlayers[i].plusX.setTitle("+\(bigChungus)", for: .normal)
        }
    }
    
    func rerenderScore(_ player : Player) {
        player.scoreLabel.text = "\(player.score)"
    }
    
    func checkForDeath(_ player : Player) {
        if player.score <= 0 {
            player.nameLabel.text = "DEAD"
            player.nameLabel.textColor = UIColor.red
            player.minusX.isEnabled = false
            player.minus1.isEnabled = false
            player.plus1.isEnabled = false
            player.plusX.isEnabled = false
            player.minusX.backgroundColor = UIColor.lightGray
            player.minus1.backgroundColor = UIColor.lightGray
            player.plus1.backgroundColor = UIColor.lightGray
            player.plusX.backgroundColor = UIColor.lightGray
            player.nameLabel.isUserInteractionEnabled = false
        }
    }
    
    func disableAddPlayer() {
        addPlayerButton.isEnabled = false
        addPlayerButton.isHidden = true
    }
    
    func makeChungusButton() {
        let chungusHolder = UIStackView()
        chungusHolder.axis  = NSLayoutConstraint.Axis.horizontal
        chungusHolder.translatesAutoresizingMaskIntoConstraints = false
        
        let bigChungusButton = UIButton()
        bigChungusButton.setTitle("Change Big Damage", for: .normal)
        bigChungusButton.backgroundColor = UIColor.blue
        bigChungusButton.addTarget(self, action: #selector(changeChungus(_:)), for: .touchUpInside)
        
        let bigChungusLabel = UILabel()
        bigChungusLabel.text = "test"
        
        chungusHolder.addArrangedSubview(bigChungusLabel)
        chungusHolder.addArrangedSubview(bigChungusButton)
        self.view.addSubview(chungusHolder)
        
        // add constraints
        bigChungusButton.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true
        bigChungusButton.centerYAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.bottomAnchor, constant: -20).isActive = true
    }
    
    
    
    func addPlayersButton() {
        
        // create button
        addPlayerButton.setTitle("Add Player", for: .normal)
        addPlayerButton.backgroundColor = UIColor.blue
        addPlayerButton.addTarget(self, action: #selector(handleAddingPlayers(_:)), for: .touchUpInside)
        addPlayerButton.translatesAutoresizingMaskIntoConstraints = false
        self.view.addSubview(addPlayerButton)
        
        // add constraints
        addPlayerButton.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true
        addPlayerButton.centerYAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor, constant: 20).isActive = true
    }
    
    func showPlayers() {
        // some stack view settings I found on the internet lmbao
        stackView.axis  = NSLayoutConstraint.Axis.vertical
        stackView.distribution  = UIStackView.Distribution.equalSpacing
        stackView.alignment = UIStackView.Alignment.center
        stackView.spacing   = 16.0
        stackView.translatesAutoresizingMaskIntoConstraints = false

        // add stackview to the screen
        self.view.addSubview(stackView)
        
        // add the initial players
        for i in 0...totalPlayers - 1 {
            allPlayers.append(addPlayer(Player("Player \(i + 1)", i)))
        }
        
        //Constraints for stackview that I also found on the internet
        stackView.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true
        stackView.centerYAnchor.constraint(equalTo: self.view.centerYAnchor).isActive = true
    }
    
}

