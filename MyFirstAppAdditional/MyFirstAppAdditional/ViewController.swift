//
//  ViewController.swift
//  MyFirstApp
//
//  Created by Ivan Tyurin on 22.01.2020.
//  Copyright © 2020 Ivan Tyurin. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    lazy var tabBar = tabBarController as! GameModel
    var minValue = 0
    var maxValue = 0
    var iosNum = 0
    var tryNumbers: Int = 0
    var historyBuf: [Int] = []
    
    @IBOutlet weak var cheat: UILabel!
    @IBOutlet weak var mainText: UILabel!
    @IBOutlet weak var hiddenBtn: UIButton!
    @IBOutlet weak var userText: UITextField!
    @IBOutlet weak var gameBtnStates: UIButton!
    @IBOutlet weak var gameCounter: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        viewDidAppear(true)
        // Do any additional setup after loading the view.
    }
    
    override func viewDidAppear(_ animated: Bool) {
        minValue = tabBar.minValue
        maxValue = tabBar.maxValue
        
        if minValue == maxValue {
            mainText.text = "Настрой рандом, друже"
            userText.isEnabled = false
            gameBtnStates.isEnabled = false
            gameCounter.text = "Количество попыток: " + String(tryNumbers)
            
        } else {
            iosNum = getRandom(minValue, maxValue)
            userText.isEnabled = true
            gameBtnStates.isEnabled = true
            
            userText.placeholder = "от " + String(minValue) + " до " + String(maxValue)
            mainText.text = "Испытай свою удачу..."
            cheat.text = String(iosNum)
            tryNumbers = 0
            gameCounter.text = "Количество попыток: " + String(tryNumbers)
        }
        
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        tabBar.history += historyBuf
        historyBuf = []
    }
    
    @IBAction func gameBtn(_ sender: UIButton) {        
        if let bufNum = userText.text {
            let userNum = Int(bufNum) ?? 0
            userText.text = nil
            tryNumbers += 1
            gameCounter.text = "Количество попыток: " + String(tryNumbers)
            historyBuf.append(userNum)
            
            if  userNum == iosNum || userNum == 42 {
                mainText.text = "Удача!"
                hiddenBtn.isHidden = false
                gameBtnStates.isEnabled = false
                tabBar.tryCounter += tryNumbers
                if tabBar.bestTry > tryNumbers || tabBar.bestTry == 0 {
                    tabBar.bestTry = tryNumbers
                }
            } else if userNum > iosNum {
                mainText.text = "Перебор!"
            } else {
                mainText.text = "Давай больше!"
            }
        } else {
            mainText.text = "Ты забыл число!"
        }
    }
    
    @IBAction func newGameBtn(_ sender: UIButton) {
        viewDidAppear(true)
        gameBtnStates.isEnabled = true
        hiddenBtn.isHidden = true
        mainText.text = "Давай ещё разок?"
        cheat.text = String(iosNum)
    }
    
    func getRandom(_ min: Int, _ max: Int) -> Int {
        return Int.random(in: min...max)
    }
}

