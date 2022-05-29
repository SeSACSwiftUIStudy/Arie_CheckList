//
//  ShoppingItemModel.swift
//  ShoppingCheckList
//
//  Created by Ahyeonway on 2022/05/29.
//

import Foundation
import RealmSwift

// Model
class ShoppingItem: Identifiable, ObservableObject {
    let id: Int
    var isFavorite: Bool
    var name: String
    var isChecked: Bool
    
    init(db: ShoppingItemDB) {
        id = db.id
        name = db.name
        isChecked = db.isChecked
        isFavorite = db.isFavorite
    }
    
    init() {
        self.name = ""
        self.id = -1
        self.isChecked = false
        self.isFavorite = false
    }
}

class ShoppingItemDB: Object {
    @objc dynamic var id = 0
    @objc dynamic var name = ""
    @objc dynamic var isFavorite = false
    @objc dynamic var isChecked = false
    
    override static func primaryKey() -> String? {
      "id"
    }
}
