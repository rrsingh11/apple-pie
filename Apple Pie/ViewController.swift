//
//  ViewController.swift
//  Apple Pie
//
//  Created by Ritu Raj Singh on 05/01/23.
//

import UIKit


class ViewController: UIViewController {

    var listOfWords = ["buccaneer", "swift", "glorious", "incandescent", "bug", "program"]

    let incorrectMovesAllowed = 7
    var totalWins = 0 {
        didSet {
            newRound()
        }
    }
    
    var totalLosses = 0 {
        didSet {
            newRound()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        newRound()
    }
    
    @IBOutlet var treeImageView: UIImageView!
    
    @IBOutlet var correctWordLabel: UILabel!
    @IBOutlet var scoreLabel: UILabel!
    
    
    @IBOutlet var letterButtons: [UIButton]!
    
    @IBAction func letterButtonPressed(_ sender: UIButton) {
        sender.isEnabled = false
        let letterString = sender.configuration!.title
        let letter = Character((letterString?.lowercased())!)
        currentGame.playerGuessed(letter: letter)
        updateGameState()
    }

    func updateGameState() {
        if currentGame.incorrectMovesRemaining == 0 {
            totalLosses += 1
        } else if currentGame.formattedWord == currentGame.word {
            totalWins += 1
        } else {
            updateUI()
        }
    }
    
    func enableLetterButton(_ enable: Bool) {
        for button in letterButtons {
            button.isEnabled = enable
        }
    }
    var currentGame: Game!
    
    
    func newRound() {
        if !listOfWords.isEmpty {
            let newWord = listOfWords.removeFirst()
            currentGame = Game(word: newWord, incorrectMovesRemaining: incorrectMovesAllowed, guessedLetters: [])
            enableLetterButton(true)
            updateUI()
        } else {
            enableLetterButton(false)
        }

    }
    func updateUI() {
        var letters: [String] = []
        
        for letter in currentGame.formattedWord {
            letters.append(String(letter))
        }
        let wordsWithSpacing = letters.joined(separator: " ")
        correctWordLabel.text = wordsWithSpacing
        scoreLabel.text = "Wins: \(totalWins), Losses: \(totalLosses) "
        treeImageView.image = UIImage(named: "Tree \(currentGame.incorrectMovesRemaining)")
    }
}

