//
//  PreviewContainer.swift
//  GroceryList
//
//  Created by Luan Bezerra Coelho on 18/09/24.
//

import Foundation
import SwiftData

struct Preview {
    
    let modelContainer: ModelContainer
    init() {
        let config = ModelConfiguration(isStoredInMemoryOnly: true)
        do {
            modelContainer = try ModelContainer(for: GroceryItem.self, configurations: config)
        } catch {
            fatalError("Could not initialize ModelContainer")
        }
    }
    
    func addExamples(_ examples: [GroceryItem]) {
        
        Task { @MainActor in
            examples.forEach { example in
                modelContainer.mainContext.insert(example)
            }
        }
        
    }
}
