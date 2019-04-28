//
//  ViewController.swift
//  WeightTracker
//
//  Created by marek on 27.04.2019.
//  Copyright © 2019 Marek Garczewski. All rights reserved.
//

import UIKit
import ChameleonFramework
class ViewController: UIViewController {

    @IBOutlet weak var graphIcon: UIImageView!
    @IBOutlet weak var weightIcon: UIImageView!
    @IBOutlet weak var weightLabel: UILabel!
    @IBOutlet weak var graphLabel: UILabel!
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        let tapGestureWeightIcon = UITapGestureRecognizer(target: self, action: #selector(ViewController.weightIconTapped(gesture:)))
        weightIcon.addGestureRecognizer(tapGestureWeightIcon)
        weightIcon.isUserInteractionEnabled = true
        let tapGestureGraphIcon = UITapGestureRecognizer(target: self, action: #selector(ViewController.graphIconTapped(gesture:)))
        graphIcon.addGestureRecognizer(tapGestureGraphIcon)
        graphIcon.isUserInteractionEnabled = true
        view.backgroundColor = UIColor(gradientStyle: UIGradientStyle.leftToRight, withFrame: view.frame, andColors: [ UIColor.flatPowderBlue(), UIColor.flatWhite()])
        weightLabel.textColor = UIColor(gradientStyle: UIGradientStyle.topToBottom, withFrame: view.frame, andColors: [ UIColor.flatBlue(), UIColor.flatWhite()])
        graphLabel.textColor = UIColor(gradientStyle: UIGradientStyle.leftToRight, withFrame: view.frame, andColors: [ UIColor.flatBlue(), UIColor.flatWhite()])
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        navigationController?.navigationBar.barTintColor = UIColor.flatPowderBlue()
        
    }
    
    @objc func weightIconTapped(gesture: UIGestureRecognizer) {
        
        if (gesture.view as? UIImageView) != nil {
            print("weight tapped")
            
            performSegue(withIdentifier: "goToWeights", sender: self)
        }
    }
    
    @objc func graphIconTapped(gesture: UIGestureRecognizer) {
        
        if (gesture.view as? UIImageView) != nil {
            print("graph tapped")
            
            performSegue(withIdentifier: "goToGraph", sender: self)
        }
    }
    
    
    
}

