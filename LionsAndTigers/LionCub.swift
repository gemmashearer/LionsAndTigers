//
//  LionCub.swift
//  LionsAndTigers
//
//  Created by Gemma Shearer on 03/06/2015.
//  Copyright (c) 2015 GemmaShearer. All rights reserved.
//

import Foundation

//this is a subclass of Lion - it inherits all of the properties and functions from the lion file
// the Lion is the superclass of the LionCub class.

//subclasses can have own functions and override functions declared in the superclass. The superclass won't have


class LionCub:Lion {
    func rubLionCubsBelly () {
        println("Snuggle and be happy")
    }
    // this is overriding the roar functionality so that roar has a different output in the
    override func roar() {
        super.roar()
        println("LionCub: Growl Growl")
    }
    
    //super keyword refers to the superclass - can access functions declared in the superclass. What the code is doing above is making the super classes version of roar run but then running the lioncubs version of roar as well.

    //function to display random facts that are different to the super
    override func randomFact() -> String {
        var randomFactString:String
        if isAlphaMale {
            randomFactString = "Cubs are usually hidden in the dense bush for approximately six weeks."
        } else {
            randomFactString = "Cubs begin eating meat at about the age of six weeks"
        }
        return randomFactString
    }
}