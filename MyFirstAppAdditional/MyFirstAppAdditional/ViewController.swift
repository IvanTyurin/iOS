//
//  ViewController.swift
//  MyFirstApp
//
//  Created by Ivan Tyurin on 22.01.2020.
//  Copyright © 2020 Ivan Tyurin. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    private var minValue = 0
    private var maxValue = 0
    lazy var gameModel = tabBarController as! GameModel
    
    @IBOutlet weak var cheat: UILabel!
    @IBOutlet weak var mainText: UILabel!
    @IBOutlet weak var hiddenBtn: UIButton!
    @IBOutlet weak var userText: UITextField!
    @IBOutlet weak var gameBtnStates: UIButton!
    @IBOutlet weak var gameCounter: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        viewDidAppear(true)
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(true)
        
        minValue = gameModel.getRange().min
        maxValue = gameModel.getRange().max
        
        if minValue == maxValue {
            mainText.text = "Настрой рандом, друже"
            userText.isEnabled = false
            gameBtnStates.isEnabled = false
            gameCounter.text = "Количество попыток: " + String(gameModel.getTryNumber())
            
        } else {
            userText.isEnabled = true
            gameBtnStates.isEnabled = true
            gameModel.setRandomNumber()
            
            userText.placeholder = "от " + String(minValue) + " до " + String(maxValue)
            mainText.text = "Испытай свою удачу..."
            cheat.text = String(gameModel.getRandomNumber())
            gameCounter.text = "Количество попыток: " + String(gameModel.getTryNumber())
        }
    }
    
    @IBAction func gameBtn(_ sender: UIButton) {
        if let bufNum = userText.text {
            let userNum = Int(bufNum) ?? 0
            userText.text = nil
            
            switch gameModel.tryGuess(userNum) {
                case .equal:
                    mainText.text = "Удача!"
                    hiddenBtn.isHidden = false
                    gameBtnStates.isEnabled = false
                    return
                    
                case .over:
                    mainText.text = "Перебор!"
                    return

                case .less:
                    mainText.text = "Давай больше!"
                    return
                
                gameCounter.text = "Количество попыток: " + String(gameModel.getTryNumber())
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
        cheat.text = String(gameModel.getRandomNumber())
        gameModel.setRandomNumber()
    }
}

