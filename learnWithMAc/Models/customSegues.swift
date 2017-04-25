//
//  customSegues.swift
//  learnWithMAc
//
//  Created by Etnuh on 2/9/17.
//  Copyright © 2017 Rainman Technologies. All rights reserved.
//

import UIKit

class customSegues: UIStoryboardSegue {
    
    
    override func perform() {
        scale()
    }
    
    func scale() {
        
        let toViewController = self.destination
        let fromViewController = self.source
        
        let containerView = fromViewController.view.superview
        let originalCenter = fromViewController.view.center
        
        toViewController.view.transform = CGAffineTransform(scaleX: 0.5, y: 0.5)
        toViewController.view.center = originalCenter
        
        containerView?.addSubview(toViewController.view)
        
        UIView.animate(withDuration: 0.5, delay: 0, options: .transitionCrossDissolve, animations: {
            toViewController.view.transform = CGAffineTransform.identity
        }, completion: { success in
            fromViewController.present(toViewController, animated: false, completion: nil)
            
        })
    }
    
}


class UnwindScaleSegues: UIStoryboardSegue {
    
    override func perform() {
        scale()
    }
    
    func scale() {
        
        let toViewController = self.destination
        let fromViewController = self.source
        
        //   let containerView = fromViewController.view.superview
        //   let originalCenter = fromViewController.view.center
        
        fromViewController.view.superview?.insertSubview(toViewController.view, at: 0)
        
        UIView.animate(withDuration: 0.5, delay: 0, options: .transitionCurlUp, animations: {
            fromViewController.view.transform = CGAffineTransform(scaleX: 0.5, y: 0.5)
        }, completion: { success in
            fromViewController.dismiss(animated: true, completion: nil)
        })
    }
    
}
