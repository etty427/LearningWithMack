//
//  PopUpViewController.swift
//  learnWithMAc
//
//  Created by Ty rainey on 4/4/17.
//  Copyright © 2017 Rainman Technologies. All rights reserved.
//

import UIKit

class PopUpViewController: UIViewController {

    @IBOutlet weak var button: UIButton!
    @IBOutlet weak var button2: UIButton!
    @IBOutlet weak var button3: UIButton!
    @IBOutlet weak var close: UIButton!
    @IBOutlet weak var animationView: UIView!
    @IBAction func closeBox(_ sender: Any) {
        
        self.view.removeFromSuperview()
 
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        
        animationView.layer.cornerRadius = 8
        close.layer.cornerRadius = 12
        button.layer.cornerRadius = 8
        button2.layer.cornerRadius = 8
        button3.layer.cornerRadius = 8
        
        
        
        UIView.animate(withDuration: 0.15, delay: 0.25, options: .curveEaseIn, animations: { () -> Void in
            
            self.close.transform = CGAffineTransform(rotationAngle: CGFloat(Double.pi/3 * 2))
        }, completion: nil)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    @IBAction func button2Pressed(_ sender: Any) {
        
        let alert = UIAlertController(title: "Level 2", message: "This function is not available in this version.", preferredStyle: .alert)
        
        let action = UIAlertAction(title: "OK", style: .destructive) { (action) in
        
            
        }
        alert.addAction(action)
        
        present(alert, animated: true, completion: nil)
        
    }
    
    @IBAction func button3Pressed(_ sender: Any) {
       
        let alert = UIAlertController(title: "Level 3", message: "This function is not available in this version.", preferredStyle: .alert)
        
        let action = UIAlertAction(title: "OK", style: .destructive) { (action) in
            
            
        }
        alert.addAction(action)
        
        present(alert, animated: true, completion: nil)
        
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
