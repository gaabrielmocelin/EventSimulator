//
//  ViewController.swift
//  Simulator
//
//  Created by Gabriel Mocelin on 21/08/18.
//  Copyright © 2018 Gabriel Mocelin. All rights reserved.
//

import UIKit
import Charts

class ViewController: UIViewController {

    @IBOutlet weak var scatterChart: ScatterChartView!
    let numberGenerator = RandomNumberGenerator()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        var numbers: [ChartDataEntry] = []
        
        for _ in 0...1000 {
            let number = numberGenerator.random()
            numbers.append(ChartDataEntry(x: number, y: number))
        }
        
        let set = ScatterChartDataSet(values: numbers)
        set.setColor(ChartColorTemplates.colorful()[1])
        set.setScatterShape(.circle)
        set.scatterShapeSize = 50
        
        scatterChart.data = ChartData(dataSets: [set])
        
        Simulator()
    }
}

