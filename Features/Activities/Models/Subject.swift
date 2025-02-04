import Foundation
import SwiftData

@Model
class Subject {
    var title: String
    
    init(title: String) {
        self.title = title
    }
}
