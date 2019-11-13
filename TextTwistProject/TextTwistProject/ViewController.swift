//
//  ViewController.swift
//  TextTwistProject
//
//  Created by Benjamin Stone on 11/4/19.
//  Copyright © 2019 Benjamin Stone. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var selectedWord = Word.getRandomWord()

    
    @IBOutlet var screen: UIView!
    @IBOutlet weak var randomWordLabel: UILabel!
    
    @IBOutlet weak var textField: UITextField!

    override func viewDidLoad() {
        super.viewDidLoad()
        randomWordLabel.text = selectedWord.scrambled
        print(selectedWord)
        textField.delegate = self
    }

    func checkResults() {
        let guessed = (textField.text ?? "").lowercased()
        
        let userInput = Set(guessed)
        let correctAnswer = Set(selectedWord.unscrambled)
        
        if userInput.isSubset(of: correctAnswer) {
            if guessed.lowercased() == selectedWord.unscrambled {
            screen.backgroundColor = .green
            }
        } else {
            screen.backgroundColor = .red
        }
        
    }

    @IBAction func resetButton(_ sender: UIButton) {
    }
    
    
    @IBAction func textFieldAction(_ sender: UITextField) {
    }
    
    
    
}
extension ViewController: UITextFieldDelegate {
    func textFieldShouldBeginEditing(_ textField: UITextField) -> Bool {
        return true
    }
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
    }
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        
        
        
        return true
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        checkResults()
        textField.resignFirstResponder()
        return true
    }
}
