//
//  SettingsVC.swift
//  MyFirstAppAdditional
//
//  Created by Ivan Tyurin on 28.01.2020.
//  Copyright © 2020 Ivan Tyurin. All rights reserved.
//

import UIKit

class SettingsVC: UIViewController {
    lazy var tabBar = tabBarController as! GameModel
    
    var minValue = 0
    var maxValue = 0
    
    @IBOutlet weak var minValueText: UILabel!
    @IBOutlet weak var maxValueText: UILabel!
    @IBOutlet weak var userMinValue: UITextField!
    @IBOutlet weak var userMaxValue: UITextField!
        
    override func viewDidLoad() {
        super.viewDidLoad()
        minValueText.text = String(tabBar.minValue)
        maxValueText.text = String(tabBar.maxValue)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        minValue = tabBar.minValue
        maxValue = tabBar.maxValue
        minValueText.text = String(minValue)
        maxValueText.text = String(maxValue)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        tabBar.minValue = minValue
        tabBar.maxValue = maxValue
    }
    
    @IBAction func safeButton(_ sender: UIButton) {
        var min: Int?
        var max: Int?
        
        guard let minValueIn = userMinValue.text else {
            return
        }
        guard let maxValueIn = userMaxValue.text else {
            return
        }
        
        min = Int(minValueIn)
        max = Int(maxValueIn)
        
        if let min = min {
            minValue = min
        }
        if let max = max {
            maxValue = max
        }
        
        minValueText.text = String(minValue)
        maxValueText.text = String(maxValue)
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
