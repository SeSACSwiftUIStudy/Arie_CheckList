//
//  StoreManager.swift
//  ShoppingCheckList
//
//  Created by Ahyeonway on 2022/05/29.
//

import Foundation
import RealmSwift

// 저장하는 클래스
class StoreManager: ObservableObject {
    private var shoppingListResults: Results<ShoppingItemDB>
    
    var shoppingList: [ShoppingItem] {
        shoppingListResults.map(ShoppingItem.init)
    }
    
    init() {
        let realm = try! Realm()
        shoppingListResults = realm.objects(ShoppingItemDB.self)
    }
}

extension StoreManager {
    // objectWillChange.send(): 변경된 사항이 있다고 알려줌
    func create(name: String) {
      objectWillChange.send()
      do {
        let realm = try Realm()

        let shoppingItemDB = ShoppingItemDB()
        shoppingItemDB.id = UUID().hashValue
        shoppingItemDB.name = name

        try realm.write {
          realm.add(shoppingItemDB)
        }
      } catch let error {
        // Handle error
        print(error.localizedDescription)
      }
    }

    func toggleCheckState(item: ShoppingItem) {
      objectWillChange.send()
      do {
        let realm = try Realm()
        try realm.write {
          realm.create(
            ShoppingItemDB.self,
            value: ["id": item.id, "isChecked": !item.isChecked],
            update: .modified)
        }
      } catch let error {
        print(error.localizedDescription)
      }
    }

    func toggleFavoriteState(item: ShoppingItem) {
      objectWillChange.send()
      do {
        let realm = try Realm()
        try realm.write {
          realm.create(
            ShoppingItemDB.self,
            value: ["id": item.id, "isFavorite": !item.isFavorite],
            update: .modified)
        }
      } catch let error {
        print(error.localizedDescription)
      }
    }


    func delete(shoppingItemID: Int) {
      objectWillChange.send()
      guard let item = shoppingListResults.first(
        where: { $0.id == shoppingItemID })
        else { return }

      do {
        let realm = try Realm()
        try realm.write {
          realm.delete(item)
        }
      } catch let error {
        print(error.localizedDescription)
      }
    }
    
    func delete(set: IndexSet) {
      objectWillChange.send()
      guard let item = shoppingListResults.first(
        where: { $0.id == 1 })
                
        else { return }

      do {
        let realm = try Realm()
        try realm.write {
          realm.delete(item)
        }
      } catch let error {
        print(error.localizedDescription)
      }
    }
  }
