import Foundation
import SwiftData

@Model
class GroceryItem {
    
    var title: String
    var isChecked: Bool
    
    init(title: String, isChecked: Bool = false) {
        self.title = title
        self.isChecked = isChecked
    }
}

