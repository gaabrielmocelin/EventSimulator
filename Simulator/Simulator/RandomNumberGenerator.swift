//
//  RandomNumberGenerator.swift
//  Simulator
//
//  Created by Gabriel Mocelin on 21/08/18.
//  Copyright © 2018 Gabriel Mocelin. All rights reserved.
//

import Foundation

class RandomNumberGenerator {
    
    var seed = 0 //seed of 0 by default
    let a, c, m: Int
    
    //we will use microsoft random by default
    init() {
        self.a = 214013
        self.c = 2531011
        self.m = Int(pow(2.0, 31.0)) //2^31 or 2147483648
    }
    
    func seed(seed: Int) -> Void {
        self.seed = seed
    }
    
    func random() -> Double {
        seed = (a * seed + c) % m
        return Double(seed) / Double(m)
    }
    
    func random(for range: ClosedRange<Double>) -> Double {
        return (range.upperBound - range.lowerBound) * random() + range.lowerBound
    }
}
