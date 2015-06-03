//
//  Lion.swift
//  LionsAndTigers
//
//  Created by Gemma Shearer on 03/06/2015.
//  Copyright (c) 2015 GemmaShearer. All rights reserved.
//

import Foundation
import UIKit


// created a new class Lion along with the additional properties with default values

class Lion {
    var age = 0
    var isAlphaMale = false
    var image = UIImage(named: "")
    var name = ""
    var subspecies = ""
    
    
    // function to make the lion roar
    func roar () {
        println("Lion: Roar roar")
    
    }
    
    //when this is called it will change the alpha male to true
    func changeToAlphaMale () {
        self.isAlphaMale = true
    }
    
    func randomFact() -> String {
        var randomFact:String
            if self.isAlphaMale {
                randomFact = "Male lions are easy to recognize thanks to their distinctive manes. Males with darker manes are more likely to attract females."
            } else {
                randomFact = "Female Lionesses form the stable social unit and do not tolerate outside females."
        }
        return randomFact
    }
}

//would have been better to create a class for both lions and tigers and have each one of them as a subclass

//one difference between structs and classes is that the class properties can be accessed and updated but structs cant