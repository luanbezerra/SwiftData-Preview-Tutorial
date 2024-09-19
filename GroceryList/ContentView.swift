//
//  ContentView.swift
//  GroceryList
//
//  Created by Luan Bezerra Coelho on 18/09/24.
//

import SwiftUI
import SwiftData

struct ContentView: View {
    
    @Query(sort: [SortDescriptor(\GroceryItem.title)]) var items: [GroceryItem]
    @Environment(\.modelContext) var context
    @State private var title: String = ""
    
    var body: some View {
        NavigationStack {
            List {
                
                Section {
                    ForEach(items) { item in
                        Button(action: { item.isChecked.toggle() }, label: {
                            HStack{
                                Image(systemName: item.isChecked ? "checkmark.square.fill" : "square")
                                Text(item.title)
                                    .foregroundStyle(.black)
                                Spacer()
        
                            }
                        })
                    }
                    .onDelete { indexSet in
                        indexSet.forEach { index in
                            let item = items[index]
                            context.delete(item)
                        }
                    }
                    TextField("Adicione aqui", text: $title)
                        .onSubmit {
                            let item = GroceryItem(title: title)
                            context.insert(item)
                            title = ""
                        }
                }
                
                HStack{
                                        
                    Button(
                        action: {
                            for item in items {
                                item.isChecked = false
                            }
                        },
                        label: {
                            Text("Reuse list")
                        }
                    )
                    .buttonStyle(.borderedProminent)
                    
                    Spacer()
                    
                    Button(
                        role: .destructive,
                        action: {
                            for index in items.indices {
                                let groceryItem = items[index]
                                context.delete(groceryItem)
                            }
                        },
                        label: {
                            Text("Erase all")
                        }
                    )
                    .buttonStyle(.borderedProminent)
                }
                
            }
            .navigationTitle("Grocery List")
        }
    }
}

#Preview {
    let preview = Preview()
    preview.addExamples(GroceryItem.sampleItems)
    return ContentView()
        .modelContainer(preview.modelContainer)
}
