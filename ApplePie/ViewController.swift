//
//  ViewController.swift
//  ApplePie
//
//  Created by Apple on 03/03/2021.
//

import UIKit

class ViewController: UIViewController {
    
    var listOfWords = ["buccaneer", "swift", "glorious", "incandesent", "bug", "program", "hutao", "xiao", "jean", "mona", "zhongli", "CTrerach"]
    let incorrectMovesAllowed = 7
    var totalWins = 0{
        didSet{
            newRound()
        }
    }
    var totalLoseses = 0{
        didSet{
            newRound()
        }
    }
    @IBOutlet weak var treeImageView: UIImageView!
    @IBOutlet weak var correctWordLabel: UILabel!
    
    @IBOutlet var letterButtons: [UIButton]!
    @IBOutlet weak var scoreLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        newRound()
    }
    
    var currentGame : Game!

    func newRound() {
        if !listOfWords.isEmpty{
        let newWord = listOfWords.removeFirst()
        currentGame = Game(word: newWord, incorectMovesRemaining: incorrectMovesAllowed, guessedLetters: [])
            enableLetterButtons(true)
            updateUI()
        }else{
            enableLetterButtons(false)
        }
    }
    
    func enableLetterButtons(_ enable: Bool) {
        for button in letterButtons{
            button.isEnabled = enable
        }
    }
    
    func updateUI() {
        var letters = [String]()
        for letter in currentGame.formattedWord{
            letters.append(String(letter))
        }
        let wordWithSpacing = letters.joined(separator: " ")
        
        correctWordLabel.text = wordWithSpacing
        scoreLabel.text = "Wins: \(totalWins), Loseses: \(totalLoseses)"
        treeImageView.image = UIImage(named: "Tree \(currentGame.incorectMovesRemaining)")
    }

    @IBAction func letterButtonPressed(_ sender: UIButton) {
        sender.isEnabled = false
        let letterString = sender.title(for: .normal)!
        let letter = Character(letterString.lowercased())
        if currentGame.playerGuessed(letter: letter){
            sender.setTitleColor(.green, for: .normal)
        }else{
            sender.setTitleColor(.red, for: .normal)
        }

        updateGameState()
    }
    
    func updateGameState(){
        if currentGame.incorectMovesRemaining == 0{
            totalLoseses += 1
        }else if currentGame.word == currentGame.formattedWord{
            totalWins += 1
        }else{
            updateUI()
        }
    }
    
}

