//
//  Category.swift
//  Todopp
//
//  Created by Mehmet Eroğlu on 11.04.2020.
//  Copyright © 2020 Mehmet Eroğlu. All rights reserved.
//

import Foundation
import RealmSwift
import ChameleonFramework

class Category: Object {
    @objc dynamic var name: String = ""
    @objc dynamic var bgColor: String = UIColor.randomFlat().hexValue()
    // forvard datbase reletionship
    let toItems = List<Item>()
    
}
