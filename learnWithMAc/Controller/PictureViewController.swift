//
//  PictureViewController.swift
//  learnWithMAc
//
//  Created by Ty rainey on 4/12/17.
//  Copyright © 2017 Rainman Technologies. All rights reserved.
//

import UIKit

class PictureViewController: UIViewController {
    
    let myLetters = letter()
    var currentWord = 0
    var correctChoicePlacement: UInt32 = 0
    var points = Int()
    
    
    
    @IBOutlet weak var letterLabel: UILabel!
    @IBOutlet weak var pointsLabel: UILabel!
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        newGame()
        // Do any additional setup after loading the view.
    }

    func newGame() {
        
        letterLabel.text = myLetters.wordsForGame[currentWord]
        
        correctChoicePlacement = arc4random_uniform(UInt32(3))+1
        
        var x = 1
        
        for i in 1...myLetters.imagesForWordGame.count {
            
            // Create a button
            if let button = (view.viewWithTag(i) as? UIButton) {
                
                button.layer.cornerRadius = 8
                button.layer.masksToBounds = true
                button.layer.shadowOpacity = 0.5
                
                if (i == Int(correctChoicePlacement)) {
                    
                  //  button.setBackgroundImage(myLetters.myChoice[currentWord][0], for: .normal)
                    
                    }
                    
                
                else {
                    
                //    button.setBackgroundImage(myLetters.myChoice[currentWord][x] as! UIImage, for: .normal)
                    
                    x = 2
                }
            }
        }
        currentWord += 1
    
    }
    @IBAction func buttonPressed(_ sender: UIButton) {
        
        if (sender.tag == Int(correctChoicePlacement)) {
            
            print("Right")
            points += 1
            pointsLabel.text = String(points)
        }
        else {
            
            print("Wrong")
            
        }
        
        if (currentWord != myLetters.wordsForGame.count) {
            
            newGame()
            
        }
        else {
            
            let alert = UIAlertController(title: "Your Score",
                                          message: "You scored \(points) points.",
                preferredStyle: .alert)
            let action1 = UIAlertAction(title: "Play Again?", style: .default, handler: { (action) -> Void in
                
                self.currentWord = Int(arc4random_uniform(UInt32(3)))
                self.currentWord = 0
                self.correctChoicePlacement = 0
                self.points = 0
                self.pointsLabel.text = String(self.points)
                self.newGame()
                
                
            })
            
            // Add action buttons and present the Alert
            alert.addAction(action1)
            
            
            present(alert, animated: true, completion: nil)
            
        }
    }



}
