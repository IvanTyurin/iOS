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
    
    @IBOutlet weak var cheat: UILabel!
    @IBOutlet weak var mainText: UILabel!
    @IBOutlet weak var hiddenBtn: UIButton!
    @IBOutlet weak var userText: UITextField!
    @IBOutlet weak var gameBtnStates: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        mainText.text = "Испытай свою удачу..."
        cheat.text = String(iosNum)
    }
    
    @IBAction func gameBtn(_ sender: UIButton) {
        if let bufNum = userText.text {
           let userNum = Int(bufNum) ?? 0
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

    }
    
    @IBAction func newGameBtn(_ sender: UIButton) {
        iosNum = Int.random(in: 0...100)
        gameBtnStates.isEnabled = true
        hiddenBtn.isHidden = true
        mainText.text = "Давай ещё разок?"
        cheat.text = String(iosNum)
    }
}

