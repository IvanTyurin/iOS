//
//  ViewController.swift
//  MyFirstApp
//
//  Created by Ivan Tyurin on 22.01.2020.
//  Copyright © 2020 Ivan Tyurin. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    var minValue = 0
    var maxValue = 0
    var iosNum = 0
    var tryNumbers: Int = 0
    
    @IBOutlet weak var cheat: UILabel!
    @IBOutlet weak var mainText: UILabel!
    @IBOutlet weak var hiddenBtn: UIButton!
    @IBOutlet weak var userText: UITextField!
    @IBOutlet weak var gameBtnStates: UIButton!
    @IBOutlet weak var gameCounter: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    override func viewDidAppear(_ animated: Bool) {
        let tabBar = tabBarController as! GameModel
        minValue = tabBar.minValue
        maxValue = tabBar.maxValue
        
        if minValue == maxValue {
            mainText.text = "Настрой рандом, друже"
        } else {
            iosNum = getRandom(minValue, maxValue)
            mainText.text = "Испытай свою удачу..."
            cheat.text = String(iosNum)
            tryNumbers = 0
            gameCounter.text = "Количество попыток: " + String(tryNumbers)
        }
        
    }
    
    @IBAction func gameBtn(_ sender: UIButton) {
        if let bufNum = userText.text {
            let userNum = Int(bufNum) ?? 0
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
        } else {
            mainText.text = "Ты забыл число!"
        }
        
        print("*******************", "\n")
        print(minValue)
        print(maxValue)
        print("*******************", "\n")
    }
    
    @IBAction func newGameBtn(_ sender: UIButton) {
        viewDidAppear(true)
        gameBtnStates.isEnabled = true
        hiddenBtn.isHidden = true
        mainText.text = "Давай ещё разок?"
        cheat.text = String(iosNum)
        /*tryNumbers = 0
        gameCounter.text = "Количество попыток: " + String(tryNumbers)*/
    }
    
    func getRandom(_ min: Int, _ max: Int) -> Int {
        return Int.random(in: min...max)
    }
}

