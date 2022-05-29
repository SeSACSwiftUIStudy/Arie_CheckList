//
//  ItemCell.swift
//  ShoppingCheckList
//
//  Created by Ahyeonway on 2022/05/29.
//

import SwiftUI

struct ItemCell: View {
    @EnvironmentObject var store: StoreManager
    @ObservedObject var item: ShoppingItem
    
    var body: some View {
        HStack {
            Button {
                store.toggleCheckState(item: item)
                print("button 1")
            } label: {
                item.isChecked ? Image(systemName: "checkmark.square.fill") : Image(systemName: "checkmark.square")
            }
            .buttonStyle(BorderlessButtonStyle())
            Text(item.name)
                .padding(.horizontal)
            Spacer()
            Button {
                store.toggleFavoriteState(item: item)
                print("button 2")
            } label: {
                item.isFavorite ? Image(systemName: "star.fill") : Image(systemName: "star")
            }
            .buttonStyle(BorderlessButtonStyle())
        }
    }
}

struct ItemCell_Previews: PreviewProvider {
    static var previews: some View {
        ItemCell(item: ShoppingItem())
            .environmentObject(StoreManager())
    }
}
