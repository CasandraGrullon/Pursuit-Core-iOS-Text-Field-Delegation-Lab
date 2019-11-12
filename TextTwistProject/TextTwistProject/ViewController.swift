//
//  ViewController.swift
//  TextTwistProject
//
//  Created by Benjamin Stone on 11/4/19.
//  Copyright © 2019 Benjamin Stone. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var randomWordLabel: UILabel!
    
    @IBOutlet weak var textField: UITextField!
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        randomWordLabel.text = Word.getRandomWord().scrambled
    }


    @IBAction func resetButton(_ sender: UIButton) {
    }
    
    
    @IBAction func textFieldAction(_ sender: UITextField) {
    }
    
    
    
}

