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
import ChameleonFramework
class GraphViewController: UIViewController {

    @IBOutlet weak var textLabel: UILabel!
    @IBOutlet weak var lineChart: LineChartView!
    var weightsArray: Results<Data>?
    let realm = try! Realm()
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        navigationController?.navigationBar.barTintColor = UIColor.flatPowderBlue()
        loadData()
        if weightsArray!.count > 0 {
            setChartValue()
            textLabel.isHidden = true
        }
        else {
            textLabel.isHidden = false
            lineChart.noDataText = ""
        }
    }
    
    func setChartValue() {
        
        guard let count = weightsArray?.count else {fatalError()}
        
        let values = (0...count-1).map {(i)->ChartDataEntry in
            return ChartDataEntry(x: Double(i), y: Double(weightsArray![i].weight)!)
        }
        
        let set1 = LineChartDataSet(entries: values, label: "Your weight")
        set1.colors = [NSUIColor.flatPowderBlue()]
        set1.circleColors = [NSUIColor.flatPowderBlue()]
        let data = LineChartData(dataSet: set1)
        lineChart.tintColor = UIColor.flatPowderBlue()
        self.lineChart.data = data
        
        
    }
    func loadData() {
        weightsArray = realm.objects(Data.self)
    }
    


}
