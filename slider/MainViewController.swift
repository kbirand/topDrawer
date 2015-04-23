//
//  ViewController.swift
//  slider
//
//  Created by Koray Birand on 23/04/15.
//  Copyright (c) 2015 Koray Birand. All rights reserved.
//

import UIKit


var mV = MainViewController()

class MainViewController: UIViewController {
    
   
    @IBOutlet weak var selHeight: NSLayoutConstraint!
    @IBOutlet var mainView: UIView!
    @IBOutlet weak var topContainer: UIView!
    @IBOutlet weak var bottomContainer: UIView!
    @IBOutlet weak var topAlign: NSLayoutConstraint!
    @IBOutlet weak var viewHeight: NSLayoutConstraint!
    var sHeight = UIApplication.sharedApplication().statusBarFrame.size.height
    var myButtonState = 1
    var topMenuHeight : CGFloat = 150
    
    
    @IBAction func moveTop(sender: AnyObject) {
        
        displayFavorites()
    
    }
    
    override func willRotateToInterfaceOrientation(toInterfaceOrientation: UIInterfaceOrientation, duration: NSTimeInterval) {
       
        if toInterfaceOrientation == UIInterfaceOrientation.Portrait {
            viewHeight.constant = mainView.frame.size.width - sHeight
        } else if toInterfaceOrientation == UIInterfaceOrientation.PortraitUpsideDown {
            viewHeight.constant = mainView.frame.size.width - sHeight
        } else {
            if (UIDevice.currentDevice().userInterfaceIdiom == UIUserInterfaceIdiom.Pad) {
                viewHeight.constant = mainView.frame.size.width - sHeight
            } else {
                viewHeight.constant = mainView.frame.size.width
            }
        }
        
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        mV = self
        
        selHeight.constant = topMenuHeight
        
        topContainer.alpha = 0
        topAlign.constant = -(topMenuHeight)
        viewHeight.constant = mainView.frame.size.height - sHeight
        
        
        var swipeDown = UISwipeGestureRecognizer(target: self, action: "respondToSwipeGesture:")
        swipeDown.direction = UISwipeGestureRecognizerDirection.Down
        self.view.addGestureRecognizer(swipeDown)
        
        var swipeUp = UISwipeGestureRecognizer(target: self, action: "respondToSwipeGesture:")
        swipeUp.direction = UISwipeGestureRecognizerDirection.Up
        self.view.addGestureRecognizer(swipeUp)
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    func displayFavorites () {
        
        if myButtonState == 1 {
            topContainer.alpha = 1
            topAlign.constant = 0
            myButtonState = 0
            
        } else {
            topContainer.alpha = 0
            topAlign.constant = -(topContainer.frame.size.height)
            myButtonState = 1
            
        }
        
        UIView.animateWithDuration(0.1, animations: { () in
            self.view.layoutIfNeeded()
        })
        
        
    }
    
    func respondToSwipeGesture(gesture: UIGestureRecognizer) {
        
        if let swipeGesture = gesture as? UISwipeGestureRecognizer {
            
            switch swipeGesture.direction {
            case UISwipeGestureRecognizerDirection.Up:
                if topAlign.constant == 0 {
                  displayFavorites()
                }
                
            case UISwipeGestureRecognizerDirection.Down:
                if topAlign.constant != 0 {
                    displayFavorites()
                }
            default:
                break
            }
        }
    }


}

