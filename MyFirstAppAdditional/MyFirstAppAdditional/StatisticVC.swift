//
//  StatisticVC.swift
//  MyFirstAppAdditional
//
//  Created by Ivan Tyurin on 29.01.2020.
//  Copyright © 2020 Ivan Tyurin. All rights reserved.
//

import UIKit

class StatisticVC: UIViewController {
    lazy var gameModel = tabBarController as! GameModel
    
    @IBOutlet weak var bestTryLabel: UILabel!
    @IBOutlet weak var allTryLabel: UILabel!
    @IBOutlet weak var historyText: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        var historyString = "История попыток: \n"
        
        if gameModel.getHistory().isEmpty {
            historyText.text = "История попыток: \nПусто!"
            bestTryLabel.text = "0"
            allTryLabel.text = "0"
        } else {
            bestTryLabel.text = String(gameModel.getBestTry())
            allTryLabel.text = String(gameModel.getTrysCounter())
            for (_, value) in gameModel.getHistory().enumerated()  {
                historyString += "#" + String(value.0) + "\t: " + String(value.1) + "\n"
            }
                    
            historyText.text = historyString
        }
    }
}
