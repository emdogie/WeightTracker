//
//  WeightsTableViewController.swift
//  WeightTracker
//
//  Created by marek on 27.04.2019.
//  Copyright © 2019 Marek Garczewski. All rights reserved.
//

import UIKit
import RealmSwift
import ChameleonFramework
class WeightsTableViewController: UITableViewController {

    var weightsArray: Results<Data>?
    let realm = try! Realm()
    override func viewDidLoad() {
        super.viewDidLoad()
        //print(Realm.Configuration.defaultConfiguration.fileURL)
        loadData()
        tableView.separatorStyle = .none
    }

    override func viewWillAppear(_ animated: Bool) {
        navigationController?.navigationBar.barTintColor = UIColor.flatPowderBlue()

    }
    // MARK: - Table view data source

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return weightsArray?.count ?? 1
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "basicCell", for: indexPath)
        if let weight = weightsArray?[indexPath.row] {
            
            let date1 = Date()
            let dateFormatterGet = DateFormatter()
            dateFormatterGet.dateFormat = "yyyy-MM-dd HH:mm:ss +0000"
            
            let dateFormatterPrint = DateFormatter()
            dateFormatterPrint.dateFormat = "MMM dd,yyyy"
            var stringDate = ""
            if let date = dateFormatterGet.date(from: date1.description) {
                stringDate = dateFormatterPrint.string(from: date)
            } else {
                print("There was an error decoding the string")
            }
            
            
            cell.textLabel?.text = weight.weight + " - " + stringDate
            
            
        }
        else {
            cell.textLabel?.text = "No data yet"
        }
        let color = UIColor.flatPowderBlue()?.darken(byPercentage: CGFloat(indexPath.row) / CGFloat(weightsArray!.count))
        cell.backgroundColor = color
        cell.textLabel?.textColor = UIColor(contrastingBlackOrWhiteColorOn: color, isFlat: true)
        return cell
    }
    
    @IBAction func addButtonTapped(_ sender: UIBarButtonItem) {
       
        var textField = UITextField()
        let alert = UIAlertController(title: "Add new weight", message: "", preferredStyle: .alert)
        let action = UIAlertAction(title: "Add new weight", style: .default) { (action) in
            do {
                try self.realm.write {
                    let newWeight = Data()
                    newWeight.weight = textField.text!
                    newWeight.date = Date()
                    
                    self.realm.add(newWeight)
                }
            }
            catch {
                print("Error with saving")
            }
            self.loadData()
        }
        alert.addTextField { (alertTextField) in
            
            alertTextField.placeholder = "Enter your weight"
            textField = alertTextField
        }
        alert.addAction(action)
        self.present(alert, animated: true, completion: nil)
    }
    
    func loadData() {
        weightsArray = realm.objects(Data.self).sorted(byKeyPath: "date", ascending: false)
        tableView.reloadData()
    }

}
