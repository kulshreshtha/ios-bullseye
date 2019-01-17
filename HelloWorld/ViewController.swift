//
//  ViewController.swift
//  HelloWorld
//
//  Created by Kulshreshtha, Sachin on 16/01/19.
//  Copyright © 2019 Kulshreshtha, Sachin. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var currentVar = 0
    var targetValue = 0
    var score = 0
    var roundNum=0

    @IBOutlet weak var slider: UISlider!
    @IBOutlet weak var randomVal:UILabel!
    @IBOutlet weak var scoreLabel:UILabel!
    @IBOutlet weak var roundLabel:UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let roundedValue=slider.value.rounded()
        currentVar=Int(roundedValue)
        startNewRound()
    }

    @IBAction func hitMe(){
        let difference = abs(targetValue-currentVar)
        var points = 100-difference
        score += points
        
        let title: String
        if difference == 0 {
            title = "Perfect!"
            points += 100
        }else if difference < 5 {
            title = "You almost had it!"
            if difference < 2 {
                points += 50
            }
        }else if difference < 10 {
            title = "Pretty good!"
        }else {
            title = "You are not even close!"
        }
        
        let msg = "Your score: \(points) points"
        
        let alert=UIAlertController(title: title, message: msg, preferredStyle: .alert)
        let action=UIAlertAction(title: "OK", style: .default, handler: {
            action in
            self.startNewRound()
        })
        
        alert.addAction(action)
        
        present(alert, animated: true,completion: nil)
        
    }
    
    @IBAction func sliderMove(_ slider: UISlider){
        let roundedValue=slider.value.rounded()
        currentVar=Int(roundedValue)
    }
    
    @IBAction func startOver(){
        score = 0
        roundNum = 0
        startNewRound()
    }
    
    func startNewRound(){
        roundNum += 1
        targetValue=Int.random(in: 1...100)
        currentVar=50
        slider.value=Float(currentVar)
        updateLabels()
    }
    
    func updateLabels(){
        randomVal.text=String(targetValue)
        scoreLabel.text=String(score)
        roundLabel.text=String(roundNum)
    }
}

