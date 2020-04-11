//
//  Category.swift
//  Todopp
//
//  Created by Mehmet Eroğlu on 11.04.2020.
//  Copyright © 2020 Mehmet Eroğlu. All rights reserved.
//

import Foundation
import RealmSwift

class Category: Object {
    @objc dynamic var name: String = ""
    // forvard datbase reletionship
    let toItems = List<Item>()
}
