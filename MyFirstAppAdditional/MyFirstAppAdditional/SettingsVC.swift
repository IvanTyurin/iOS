//
//  SettingsVC.swift
//  MyFirstAppAdditional
//
//  Created by Ivan Tyurin on 28.01.2020.
//  Copyright © 2020 Ivan Tyurin. All rights reserved.
//

import UIKit

class SettingsVC: UIViewController {
    lazy var gameModel = tabBarController as! GameModel
    
    @IBOutlet weak var minValueText: UILabel!
    @IBOutlet weak var maxValueText: UILabel!
    @IBOutlet weak var userMinValue: UITextField!
    @IBOutlet weak var userMaxValue: UITextField!
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        minValueText.text = String(gameModel.getRange().min)
        maxValueText.text = String(gameModel.getRange().max)
    }
    
    @IBAction func safeButton(_ sender: UIButton) {
        guard let minValueIn = userMinValue.text, let min = Int(minValueIn) else {
            return
        }
        guard let maxValueIn = userMaxValue.text, let max = Int(maxValueIn) else {
            return
        }

        gameModel.setRange(min, max)
        UserDefaults.standard.set(min, forKey: "minUserValue")
        UserDefaults.standard.set(max, forKey: "maxUserValue")
        minValueText.text = String(gameModel.getRange().min)
        maxValueText.text = String(gameModel.getRange().max)
    }
}
