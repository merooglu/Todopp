//
//  Item.swift
//  Todopp
//
//  Created by Mehmet Eroğlu on 11.04.2020.
//  Copyright © 2020 Mehmet Eroğlu. All rights reserved.
//

import Foundation
import RealmSwift

class Item: Object {
    @objc dynamic var title: String = ""
    @objc dynamic var done: Bool = false
    @objc dynamic var createdDate: Date = Date()
    // reverse database reletionship
    let toCategory = LinkingObjects(fromType: Category.self, property: "toItems")
}
