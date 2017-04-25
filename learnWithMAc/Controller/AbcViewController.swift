//
//  AbcViewController.swift
//  learnWithMAc
//
//  Created by Etnuh on 2/5/17.
//  Copyright © 2017 Rainman Technologies. All rights reserved.
//

import UIKit
import AVFoundation



class AbcViewController: UIViewController, AVAudioPlayerDelegate {
    
    // My Varibles
    var myletters = Letter()
    var imageInt = 0
    var counter = 0
    var audioPlayer: AVAudioPlayer!
    var gradientLayer = CAGradientLayer()
 

    
    // Outlets
    @IBOutlet weak var nextButtonOutlet: UIButton!
    @IBOutlet weak var homeButtonOutlet: UIButton!
    @IBOutlet weak var newLetterLabel: UILabel!
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var backgroundView: UIView!
  
    
    override func viewDidLoad() {
        super.viewDidLoad()
        

        
        //  Add 1 so the images change when next button is pressed.
        // imageInt = 1
        learningLetter()
        counter = 0
        imageInt = 0
        
        imageView.layer.cornerRadius = 7
    }
    
    
    // Fuctions
    @IBAction func prepareForUnwind(segue:UIStoryboardSegue) {
        
    }
    
    override func unwind(for unwindSegue: UIStoryboardSegue, towardsViewController subsequentVC: UIViewController) {
        let segue = UnwindScaleSegues(identifier: unwindSegue.identifier, source: unwindSegue.source, destination: unwindSegue.destination)
        segue.perform()
    }
    
    //  Function that shows the images and changing status of next, back buttons.
    func learningLetter() {
        
        for _ in 0...25 {
            
            imageView.image = UIImage(named: myletters.imagesForWordGame[imageInt])
            
            newLetterLabel.text = myletters.letters[imageInt]
            if imageInt <= 0 {
                homeButtonOutlet.isEnabled = false
            }
            else {
                homeButtonOutlet.isEnabled = true
            }
        }
        if imageInt >= 25 {
            nextButtonOutlet.isEnabled = false
        }
        else {
            nextButtonOutlet.isEnabled = true
        }
    }
    
    @IBAction func homeButton(_ sender: Any) {
        imageInt -= 1
        counter -= 1
        learningLetter()
    }
    
    @IBAction func playSoundButton(_ sender: Any) {
        
        sounds()
        
    }
    
    @IBAction func nextLetterButton(_ sender: Any) {
        counter += 1
        imageInt += 1
        learningLetter()
        
    }
    
    // Function that pronounces the letters.
    func sounds() {
        
        do {
            audioPlayer = try AVAudioPlayer(contentsOf: URL.init(fileURLWithPath: Bundle.main.path(forResource: "\(myletters.soundList[counter])",ofType: "mp3")!))
            audioPlayer.delegate = self
            audioPlayer.prepareToPlay()
            audioPlayer.play()
        } catch {
            print("audioPlayer error \(error.localizedDescription)")
        }
        
    }
    
}








