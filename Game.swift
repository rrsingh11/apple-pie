//
//  Game.swift
//  Apple Pie
//
//  Created by Ritu Raj Singh on 06/01/23.
//

import Foundation

//var count = 0
struct Game {
    var word: String
    var incorrectMovesRemaining: Int
    var guessedLetters: [Character]
    
    mutating func playerGuessed(letter: Character) {
        guessedLetters.append(letter)
        if !word.contains(letter) {
            incorrectMovesRemaining -= 1
        }
        
    }
    var formattedWord: String {
        
        var guessedWord = ""
        for letter in word {
            if guessedLetters.contains(letter) {
                guessedWord += "\(letter)"
            } else {
                guessedWord += "_"
            }
        }
//        print(count)
//        count += 1
        return guessedWord
    }
    
}
