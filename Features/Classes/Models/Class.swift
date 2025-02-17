import Foundation
import SwiftData

@Model
class Class {
    var name: String
    var subjects: [Subject]
    var createAt: Date
    
    init(name: String, subjects: [Subject], createAt: Date) {
        self.name = name
        self.subjects = subjects
        self.createAt = createAt
    }
}
