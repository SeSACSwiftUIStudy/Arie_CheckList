//
//  ShoppingListView.swift
//  ShoppingCheckList
//
//  Created by Ahyeonway on 2022/05/29.
//

import SwiftUI

struct ShoppingListView: View {
    @EnvironmentObject var store: StoreManager // 하나의 데이터를 여러 뷰에서 공유할때 사용
    
    @State private var content: String = ""
    
    var body: some View {
        NavigationView {
            VStack {
                TextField("무엇을 구매하실 건가요?", text: $content)
                    .padding()
                    .background(Color(uiColor: .systemBackground))
                    .onSubmit {
                        print("return")
                        store.create(name: content)
                        content = ""
                        hideKeyboard()
                    }
                List {
                    ForEach(store.shoppingList) { item in
                        ItemCell(item: item)
                    }
                    .onDelete(perform: store.delete)
                }
            }
            .navigationTitle("Shopping List")
        }
    }
}

struct ShoppingListView_Previews: PreviewProvider {
    static var previews: some View {
        ShoppingListView()
            .environmentObject(StoreManager())
    }
}

#if canImport(UIKit)
extension View {
    func hideKeyboard() {
        UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
    }
}
#endif
