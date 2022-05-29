//
//  ShoppingCheckListApp.swift
//  ShoppingCheckList
//
//  Created by Ahyeonway on 2022/05/29.
//

import SwiftUI

@main
struct ShoppingCheckListApp: App {
    var store = StoreManager()
    // stateobject > environmentobject
    // intializing이 여기서부터 새로됨
    
    var body: some Scene {
        WindowGroup {
            ShoppingListView()
                .environmentObject(store)
        }
    }
}
