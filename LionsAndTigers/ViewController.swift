//
//  ViewController.swift
//  LionsAndTigers
//
//  Created by Gemma Shearer on 30/05/2015.
//  Copyright (c) 2015 GemmaShearer. All rights reserved.
//
//properties vs local variables - the array is defined inside the UIViewController class so it is a global variable and accessible anywhere. So is the array. But my Tiger is a local variable and is only available inside the viewDidLoad function
// in a class we can access properties using the self keywowrd in a struct we cannot do this

//in both a struct and a class we can acces functions using the self keyword. can use self to access functions inside other functions - this is important when there is a naming conflict

// self is the implicit instance of the class we are working with

//more about self: self is relative - can use it to refer to the viewController - self refers to the viewController etc.
// 

// I need to check that myTiger is actually at 0 in my array
import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var myImageView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var ageLabel: UILabel!
    @IBOutlet weak var breedLabel: UILabel!
    @IBOutlet weak var randomFactLabel: UILabel!
    
    // when do we use self? when accessing properties
    //defining an empty array that we can just start adding stuff to
    var myTigers:[Tiger] = []
    var lions: [Lion] = []
    
    //defining the current index as being 0
    var currentIndex = 0
    
    // setting up the variable to track the animal that is being displayed. Starts at 0 because the is the myTiger index position
    
    var currentAnimal = (species: "Tiger", index: 0)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        var myTiger = Tiger()
        myTiger.name = "John"
        myTiger.breed = "Bengal Tiger"
        myTiger.age = 3
        myTiger.image = UIImage(named: "BengalTiger.jpg")
        myTiger.age = myTiger.ageInTigerYearsFromAge(myTiger.age)
        
        //this is adding the myTiger instance to the myTigers array, so John will now be in the array
    
        //myTiger.chuffANumberOfTimes(5, isLoud: true)
        
        self.myTigers.append(myTiger)
        
        self.myImageView.image = myTiger.image
        self.nameLabel.text = myTiger.name
        self.ageLabel.text = "\(myTiger.age)"
        self.breedLabel.text = myTiger.breed
        self.randomFactLabel.text = myTiger.randomFact()
        
        
        //this is creating the instance of secondTiger
        var secondTiger = Tiger()
        secondTiger.name = "Barbara"
        secondTiger.breed = "Indochinese Tiger"
        secondTiger.age = 2
        secondTiger.image = UIImage(named: "IndochineseTiger.jpg")
        secondTiger.age = secondTiger.ageInTigerYearsFromAge(secondTiger.age)
        
        var thirdTiger = Tiger()
        thirdTiger.name = "Pete"
        thirdTiger.breed = "Malayan Tiger"
        thirdTiger.age = 4
        thirdTiger.image = UIImage(named: "MalayanTiger.jpg")
        thirdTiger.age = thirdTiger.ageInTigerYearsFromAge(thirdTiger.age)
        
        var fourthTiger = Tiger()
        fourthTiger.name = "Nigel"
        fourthTiger.breed = "Siberian Tiger"
        fourthTiger.age = 5
        fourthTiger.image = UIImage(named: "SiberianTiger.jpg")
        fourthTiger.age = fourthTiger.ageInTigerYearsFromAge(fourthTiger.age)
        
        //this is the shorthand for adding the rest of the instances of the tiger struct to the array
        
        self.myTigers += [secondTiger, thirdTiger, fourthTiger]
   
        
        myTiger.chuffANumberOfTimes(3)
        
        //creating an instance of the lion class. We also need a new array
        var lion = Lion()
        lion.age = 4
        lion.isAlphaMale = false
        lion.image = UIImage(named: "Lion.jpg")
        lion.name = "Mufasa"
        lion.subspecies = "west African"
        
        var lioness = Lion()
        lioness.age = 3
        lioness.isAlphaMale = false
        lioness.image = UIImage(named: "Lioness.jpeg")
        lioness.name = "Sarabi"
        lioness.subspecies = "Barbary"
        
        //calling the roar function on the instances of lion
        lion.roar()
        lioness.roar()
        
        lion.changeToAlphaMale()
        println(lion.isAlphaMale)
        
        self.lions += [lion, lioness]
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func nextBarButtonItemPressed(sender: UIBarButtonItem) {
        updateAnimal()
        updateView()
        
        //these 2 functions will update the animal then update the view each time the button is pressed
    
    }
    
    //function for tracking the animal - its a helper function.
    // what this is doing. If the current animal is a tiger we will pull up the lion array. If a lion bring up a tiger from the array. Will then update the current animal to show whatever has just been pulled up
    func updateAnimal () {
        switch currentAnimal {
        case ("Tiger", _) :
            let randomIndex = Int(arc4random_uniform(UInt32(lions.count)))
            currentAnimal = ("Lion", randomIndex)
            
        default :
        let randomIndex = Int(arc4random_uniform(UInt32(myTigers.count)))
        currentAnimal = ("Tiger", randomIndex)
            println("Tigers")
            
        }
    }
    
    //this is another helper function - this will update the UI. We can refactor all the code for when the button is presses
    
  
     
        func updateView () {
            
            UIView.transitionWithView(self.view, duration: 2, options: UIViewAnimationOptions.TransitionCrossDissolve, animations: {
                
                if self.currentAnimal.species == "Tiger" {
                    println("update view function")
                    let tiger = self.myTigers[self.currentAnimal.index]
                    self.myImageView.image = tiger.image
                    self.breedLabel.text = tiger.breed
                    self.ageLabel.text = "\(tiger.age)"
                    self.nameLabel.text = tiger.name
                    self.randomFactLabel.text = tiger.randomFact()
                }
                else if self.currentAnimal.species == "Lion" {
                    let lion = self.lions[self.currentAnimal.index]
                    self.myImageView.image = lion.image
                    self.breedLabel.text = lion.subspecies
                    self.ageLabel.text = "\(lion.age)"
                    self.nameLabel.text = lion.name
                    self.randomFactLabel.text = lion.randomFact()
                }
                self.randomFactLabel.hidden = false
                }, completion: {
                    (finished: Bool) -> () in
            })
        
    }
}



