//
//  Game.swift
//  ApplePie
//
//  Created by Apple on 03/03/2021.
//

import Foundation

struct Game {
    var word: String
    var incorectMovesRemaining: Int
    var guessedLetters: [Character]
    
    mutating func playerGuessed(letter: Character) -> Bool{
        guessedLetters.append(letter)
        if !word.contains(letter){
            incorectMovesRemaining -= 1
            return false
        }else{
            return true
        }
        
        
    }
    var formattedWord : String{
        var guessedWord = ""

        for letter in word{
            if guessedLetters.contains(letter){
                guessedWord += "\(letter)"
            }
            else{
                guessedWord += "_"
            }
        }
        return guessedWord
    }

}
