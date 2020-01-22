//
//  ViewController.swift
//  MyFirstApp
//
//  Created by Ivan Tyurin on 22.01.2020.
//  Copyright © 2020 Ivan Tyurin. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var iosNum = Int.random(in: 0...100)
    var tryNumbers: Int = 0
    
    @IBOutlet weak var cheat: UILabel!
    @IBOutlet weak var mainText: UILabel!
    @IBOutlet weak var hiddenBtn: UIButton!
    @IBOutlet weak var userText: UITextField!
    @IBOutlet weak var gameBtnStates: UIButton!
    @IBOutlet weak var gameCounter: UILabel!
    
    @IBAction func gameBtn(_ sender: UIButton) {
        let userNum = Int(userText.text!)!
        tryNumbers += 1
        gameCounter.text = "Количество попыток: " + String(tryNumbers)
        if  userNum == iosNum || userNum == 42 {
            mainText.text = "Удача!"
            hiddenBtn.isHidden = false
            gameBtnStates.isEnabled = false
        } else if userNum > iosNum {
            mainText.text = "Перебор!"
        } else {
            mainText.text = "Давай больше!"
        }
    }
    
    @IBAction func newGameBtn(_ sender: UIButton) {
        iosNum = Int.random(in: 0...100)
        gameBtnStates.isEnabled = true
        hiddenBtn.isHidden = true
        mainText.text = "Давай ещё разок?"
        cheat.text = String(iosNum)
        tryNumbers = 0
        gameCounter.text = "Количество попыток: " + String(tryNumbers)
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        mainText.text = "Испытай свою удачу..."
        cheat.text = String(iosNum)
        tryNumbers = 0
        gameCounter.text = "Количество попыток: " + String(tryNumbers)
    }
}

