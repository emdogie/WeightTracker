//
//  ViewController.swift
//  WeightTracker
//
//  Created by marek on 27.04.2019.
//  Copyright © 2019 Marek Garczewski. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var graphIcon: UIImageView!
    @IBOutlet weak var weightIcon: UIImageView!
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        let tapGestureWeightIcon = UITapGestureRecognizer(target: self, action: #selector(ViewController.weightIconTapped(gesture:)))
        weightIcon.addGestureRecognizer(tapGestureWeightIcon)
        weightIcon.isUserInteractionEnabled = true
        let tapGestureGraphIcon = UITapGestureRecognizer(target: self, action: #selector(ViewController.graphIconTapped(gesture:)))
        graphIcon.addGestureRecognizer(tapGestureGraphIcon)
        graphIcon.isUserInteractionEnabled = true
        
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

