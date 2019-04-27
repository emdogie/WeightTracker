//
//  Data.swift
//  WeightTracker
//
//  Created by marek on 27.04.2019.
//  Copyright © 2019 Marek Garczewski. All rights reserved.
//

import Foundation
import RealmSwift
class Data: Object {
    @objc dynamic var weight: String = ""
    @objc dynamic var date: Date?
    
}
