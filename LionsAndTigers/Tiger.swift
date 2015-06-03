//
//  Tiger.swift
//  LionsAndTigers
//
//  Created by Gemma Shearer on 30/05/2015.
//  Copyright (c) 2015 GemmaShearer. All rights reserved.
//

//look up the difference between the increment being on the left or right - I can't remember

import Foundation

import UIKit

struct Tiger {
    var age = 0 //default value
    var name = ""
    var breed = ""
    var image = UIImage(named: "")
    
    
    //this is an instance funtion - it needs to be called on the instance of the tiger
    func chuff() {
        println("Tiger: Chuff chuff")
    }
    
    func chuffANumberOfTimes (numberOfTimes: Int) {
        for var chuff = 0; chuff < numberOfTimes; ++chuff {
            self.chuff()
        }
    }
    
    //this function and the one above it that has the same name don't have a naming conflict because they have different parameters
    
    //what this function is doing - looping through and checking the parameters that have been set - if isLoud is true it will print the Tiger: chuff chuff, if not it will go on to the else statement and print Tiger: purr purr
    
    func chuffANumberOfTimes (numberofTimes: Int, isLoud: Bool) {
        for var chuffTimes = 1; chuffTimes <= numberofTimes; chuffTimes++ {
            if isLoud {
                self.chuff()
            }else {
                println("Tiger: purr purr")
            }
        }
    }

    func ageInTigerYearsFromAge(regularAge: Int) -> Int {
        let newAge = regularAge * 3
        return newAge
    }
    
    //function to return a random fact
    func randomFact() -> String {
        let randomNumber = Int(arc4random_uniform(UInt32(3)))
        var randomFact:String
        
        if randomNumber == 0 {
            randomFact = "The tiger is the biggest species in the cat family"
        } else if randomNumber == 1 {
            randomFact = "Tigers can reach a length of 3.3 meters"
        } else {
            randomFact = "A group of tigers is known as an 'ambush' or a 'streak'"
        }
            return randomFact
    }
}

//the randomFact has a bug - it sometimes shows the same fact repeatedly - look up how to fix this


//self keyword - conflict between functions and variable names.
//any time we have a property or a function in a class we can access that using the self keyword