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
    
    @IBOutlet weak var reset: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        randomWordLabel.text = selectedWord.scrambled
        print(selectedWord)
        textField.delegate = self
        reset.isHidden = true
        reset.isEnabled = false
    }
    
    func checkResults() {
        let guessed = (textField.text ?? "").lowercased()
        
        let userInput = Set(guessed)
        let correctAnswer = Set(selectedWord.unscrambled)
        
        if userInput.isSubset(of: correctAnswer) {
            if guessed.lowercased() == selectedWord.unscrambled {
                screen.backgroundColor = .green
                reset.isEnabled = true
                reset.isHidden = false
            }
        } else {
            screen.backgroundColor = .red
        }
        
    }
    
    @IBAction func resetButton(_ sender: UIButton) {
        selectedWord = Word.getRandomWord()
        randomWordLabel.text = selectedWord.scrambled
        reset.isEnabled = false
        reset.isHidden = true
        screen.backgroundColor = .white
        textField.text = ""
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
        
        var labelArr: [Character] = Array(randomWordLabel.text ?? "")
        var userGuess = textField.text ?? ""
        var input = userGuess + string
        
        for (index , char) in labelArr.enumerated() {
            if char == Character(string) {
                labelArr.remove(at: index)
                randomWordLabel.text = String(labelArr)
            } 
        }
        
        
        
        
        
        return true
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        checkResults()
        textField.resignFirstResponder()
        return true
    }
}
