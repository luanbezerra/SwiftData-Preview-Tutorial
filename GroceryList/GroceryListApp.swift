import SwiftUI
import SwiftData

@main
struct GroceryListApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
        .modelContainer(for: GroceryItem.self)
    }
}

