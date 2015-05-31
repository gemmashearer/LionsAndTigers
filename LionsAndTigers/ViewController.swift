//
//  ViewController.swift
//  LionsAndTigers
//
//  Created by Gemma Shearer on 30/05/2015.
//  Copyright (c) 2015 GemmaShearer. All rights reserved.
//
//properties vs local variables - the array is defined inside the UIViewController class so it is a global variable and accessible anywhere. So is the array. But my Tiger is a local variable and is only available inside the viewDidLoad function

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var myImageView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var ageLabel: UILabel!
    @IBOutlet weak var breedLabel: UILabel!
    
    //defining an empty array that we can just start adding stuff to
    var myTigers:[Tiger] = []
    
    //defining the current index as being 0
    var currentIndex = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        var myTiger = Tiger()
        myTiger.name = "John"
        myTiger.breed = "Bengal Tiger"
        myTiger.age = 3
        myTiger.image = UIImage(named: "BengalTiger.jpg")
        
        //this is adding the myTiger instance to the myTigers array, so John will now be in the array
        
        myTigers.append(myTiger)
        
        println("My Tiger's name is: \(myTiger.name), its age is: \(myTiger.age), its breed is \(myTiger.breed) and here is it's photo \(myTiger.image)")
        
        myImageView.image = myTiger.image
        nameLabel.text = myTiger.name
        ageLabel.text = "\(myTiger.age)"
        breedLabel.text = myTiger.breed
        
        
        //this is creating the instance of secondTiger
        var secondTiger = Tiger()
        secondTiger.name = "Barbara"
        secondTiger.breed = "Indochinese Tiger"
        secondTiger.age = 2
        secondTiger.image = UIImage(named: "IndochineseTiger.jpg")
        
        var thirdTiger = Tiger()
        thirdTiger.name = "Pete"
        thirdTiger.breed = "Malayan Tiger"
        thirdTiger.age = 4
        thirdTiger.image = UIImage(named: "MalayanTiger.jpg")
        
        var fourthTiger = Tiger()
        fourthTiger.name = "Nigel"
        fourthTiger.breed = "Siberian Tiger"
        fourthTiger.age = 5
        fourthTiger.image = UIImage(named: "SiberianTiger.jpg")
        
        //this is the shorthand for adding the rest of the instances of the tiger struct to the array
        
        myTigers += [secondTiger, thirdTiger, fourthTiger]
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func nextBarButtonItemPressed(sender: UIBarButtonItem) {
        //creates a variable which will be the random index (i.e. the number in the array)
        
        var randomIndex:Int
        // run the do while loop - this will check to see whether the random index is the same as the current index. If the values are the same the loop will run until they are no longer the same
        do {
        
        randomIndex = Int(arc4random_uniform(UInt32(myTigers.count)))
        } while currentIndex == randomIndex
        
        currentIndex = randomIndex
        // this is getting a random index - based on how many indices there are in the myTigers array
        //this is setting the tiger to be whatever was pulled out of the tiger index
        
        let tiger = myTigers[randomIndex]
        
        //this is showing what is going to be displayed when the button is pressed - i.e. whatever tiger is taken out of the array along with all the properties set for it in place of the label
        
//        
//        myImageView.image = tiger.image
//        nameLabel.text = tiger.name
//        ageLabel.text = "\(tiger.age)"
//        breedLabel.text = tiger.breed
        
        UIView.transitionWithView(self.view, duration: 2, options: UIViewAnimationOptions.TransitionCrossDissolve, animations: {
            //we are using self here to access the properties - this allows us to access the properties rather than just accessing the name
            self.myImageView.image = tiger.image
            self.nameLabel.text = tiger.name
            self.ageLabel.text = "\(tiger.age)"
            self.breedLabel.text = tiger.breed
            }, completion: {(finished: Bool) -> () in
        
        })
    }
}

