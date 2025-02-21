import Foundation
import SwiftData

@Model
class Class {
    var name: String
    var subjects: [Subject]
    var createAt: Date
    var isAtual: Bool
    
    init(name: String, subjects: [Subject], createAt: Date, isAtual: Bool) {
        self.name = name
        self.subjects = subjects
        self.createAt = createAt
        self.isAtual = isAtual
    }
}
