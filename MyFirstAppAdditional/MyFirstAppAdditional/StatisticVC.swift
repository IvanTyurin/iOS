//
//  StatisticVC.swift
//  MyFirstAppAdditional
//
//  Created by Ivan Tyurin on 29.01.2020.
//  Copyright © 2020 Ivan Tyurin. All rights reserved.
//

import UIKit

class StatisticVC: UIViewController {
    lazy var tabBar = tabBarController as! GameModel
    
    @IBOutlet weak var bestTryLabel: UILabel!
    @IBOutlet weak var allTryLabel: UILabel!
    @IBOutlet weak var historyText: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        
        var historyString = "История попыток: \n"
        
        if tabBar.history.isEmpty {
            historyText.text = "История попыток: \nПусто!"
            bestTryLabel.text = "0"
            allTryLabel.text = "0"
        } else {
            bestTryLabel.text = String(tabBar.bestTry)
            allTryLabel.text = String(tabBar.tryCounter)
            for (index, value) in tabBar.history.enumerated()  {
                historyString += "#" + String(index) + "\t: " + String(value) + "\n"
            }
                    
            historyText.text = historyString
        }
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
