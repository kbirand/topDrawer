//
//  BottomViewController.swift
//  slider
//
//  Created by Koray Birand on 23/04/15.
//  Copyright (c) 2015 Koray Birand. All rights reserved.
//

import UIKit

class BottomViewController: UIViewController {

    @IBOutlet weak var showTop: UIButton!
    @IBAction func showTopButton(sender: AnyObject) {
        mV.displayFavorites()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

}
