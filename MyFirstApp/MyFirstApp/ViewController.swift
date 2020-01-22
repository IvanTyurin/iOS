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
    
    @IBAction func gameBtn(_ sender: UIButton) {
        let userNum = Int(userText.text!)!
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
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


}

