//
//  GraphViewController.swift
//  WeightTracker
//
//  Created by marek on 27.04.2019.
//  Copyright © 2019 Marek Garczewski. All rights reserved.
//

import UIKit
import RealmSwift
import Charts
class GraphViewController: UIViewController {

    @IBOutlet weak var lineChart: LineChartView!
    var weightsArray: Results<Data>?
    let realm = try! Realm()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loadData()
        setChartValue()
        print(weightsArray!)
    }
    
    func setChartValue() {
        
        guard let count = weightsArray?.count else {fatalError()}
        print(count)
        
        let values = (0...count-1).map {(i)->ChartDataEntry in
            return ChartDataEntry(x: Double(i), y: Double(weightsArray![i].weight)!)
        }
        
        let set1 = LineChartDataSet(entries: values, label: "Your weight")
        set1.colors = [NSUIColor.green]
        set1.circleColors = [NSUIColor.green]
        let data = LineChartData(dataSet: set1)
        lineChart.tintColor = UIColor.green
        self.lineChart.data = data
        
        
    }
    func loadData() {
        weightsArray = realm.objects(Data.self)
    }
    


}
