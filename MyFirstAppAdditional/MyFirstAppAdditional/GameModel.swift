//
//  GameModel.swift
//  MyFirstAppAdditional
//
//  Created by Ivan Tyurin on 29.01.2020.
//  Copyright © 2020 Ivan Tyurin. All rights reserved.
//

import UIKit

class GameModel: UITabBarController {
    
    var tryCounter = 0
    var bestTry = 0
    var minValue = 0
    var maxValue = 0
    
    var history: [Int] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    override func viewDidAppear(_ animated: Bool) {
        
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
