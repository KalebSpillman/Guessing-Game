//
//  main.swift
//  Guessing Game
//
//  Created by Kaleb Spillman on 8/20/18.
//  Copyright © 2018 Kaleb Spillman. All rights reserved.
//

import Foundation

//Variable that determines whether or not were still playing the game
var playingGame = true

//This loop will run while playing the game
repeat{
    // This is the random nu,ber that we have generated. We cast it from a UInt32 to an Int
    let randomNumber = Int(arc4random_uniform(101))
    
    //Printing out the random number for debugging
    
    
    //This is the number of guesses a user has to get it right
    var numberOfGuesses = 5
    
    //Welcome the user and prompt them for input
    print("Welcome to the guessing game!")
    print("Please choose a number between 0 and 100.")
    var userGuess = Int(readLine()!)
    
    //If the user enters a value thay cant be converted to an integer userGuess will equal nil.
    
    //input valadation
    while userGuess == nil {
        //Prompt the user to enter a valid number
        print("Enter a valid number.")
        //Get user input again
        userGuess = Int(readLine()!)
    }
    
    //Make another if statement that says if the users guess is not equal to the random number, print out whether the guess is too high or low.
    if userGuess != randomNumber {
        //While the user hasnt guessed the random number and still has guesses remaining
        while userGuess! != randomNumber && numberOfGuesses > 1 {
            //Remove a guess from the users remaining gusses
            numberOfGuesses -= 1
            //Tell user how many tries they have remaining
            print("You have \(numberOfGuesses) tries remaining.")
            
            if userGuess! > randomNumber {
                print("You guessed too high.")
            } else if userGuess! < randomNumber {
                print("you guessed too low.")
            }
            
            userGuess = Int(readLine()!)
            
            while userGuess == nil {
                //Prompt the user to enter a valid number
                print("Enter a valid number.")
                //Get user input again
                userGuess = Int(readLine()!)
            }
        }
    }
    
    
    
    //TODO:- Add an if statement where we check if number of guesses have been all used up and the uaser hasnt guessed the number.
    if numberOfGuesses == 1 && userGuess != randomNumber {
       //Tell the user they are out of tries and prompt them on if they want to play again or not.
        print("You ran out of tries. The correct answer was \(randomNumber).")
        print("Would you like to play again? Y/N")
        var stillPlaying = readLine()!.uppercased()
        while stillPlaying != "Y" && stillPlaying != "N" {
            print("Would you like to play again? Y/N")
            stillPlaying = readLine()!
        }
    
    if stillPlaying == "N" {
        playingGame = false
        }
        }
    
    //Check to see if user guess is equal to the random number.
    if userGuess == randomNumber {
        //Tell the user they won and ask them if they want to play again
        print("You win!")
        print("Would you like to play again Y/N")
        
        //Get user input to check
        var stillPlaying = readLine()!.uppercased()
        //If they havent enterd a Y or an N, keep asking them for input until they do
        while stillPlaying != "Y" && stillPlaying != "N" {
            print("Would you like to play again Y/N")
            stillPlaying = readLine()!
        }
        
        //If they enterned an N, set playingGame equal to false(which will end the game
        if stillPlaying == "N" {
            playingGame = false
        }
    }
} while playingGame == true

