//
//  GameModel.swift
//  MyFirstAppAdditional
//
//  Created by Ivan Tyurin on 29.01.2020.
//  Copyright © 2020 Ivan Tyurin. All rights reserved.
//

import UIKit

class GameModel: UITabBarController {
    private var trysCounter = 0
    private var bestTry = 0
    private var tryNumber = 0
    private var minValue = 0
    private var maxValue = 0
    private var systemRandomNumber = 0
    private var history: [(Int, Int)] = []
    
    enum Result {
        case equal
        case less
        case over
    }
    
    public func getRange() -> (min: Int, max: Int) {
        return (minValue, maxValue)
    }
    
    public func setRange(_ min: Int, _ max: Int) -> () {
        minValue = min
        maxValue = max
    }
    
    public func setRandomNumber() -> () {
        systemRandomNumber = Int.random(in: minValue...maxValue)
    }
    
    public func getRandomNumber() -> Int {
        return systemRandomNumber
    }
    
    public func getTryNumber() -> Int {
        return tryNumber
    }
    
    public func getTrysCounter() -> Int {
        return trysCounter
    }
    
    public func getBestTry() -> Int {
        return bestTry
    }
    
    public func getHistory() -> [(Int, Int)] {
        return history
    }
    
    public func tryGuess(_ userNumber: Int) -> Result {
        tryNumber += 1
        history.append((trysCounter, userNumber))
        
        if userNumber == systemRandomNumber {
            if bestTry < tryNumber {
                bestTry = tryNumber
            }
            trysCounter += 1
            tryNumber = 0
            return .equal
        }
        else if userNumber > systemRandomNumber {
            return .over
        }
        else {
            return .less
        }
    }
}
