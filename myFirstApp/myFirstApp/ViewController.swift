//
//  ViewController.swift
//  myFirstApp
//
//  Created by Damián Krajňák on 08/05/2020.
//  Copyright © 2020 Damián Krajňák. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    @IBAction func onGoButton(_ sender: Any) {
        performSegue(withIdentifier: "mySegue", sender: self)
    }
    
}

 
