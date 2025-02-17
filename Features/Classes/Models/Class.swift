import Foundation
import SwiftData

@Model
class Note {
    var title: String
    var note: String
    var subject: Subject
    var createAt: Date
    
    init(title: String, note: String, subject: Subject, createAt: Date) {
        self.title = title
        self.note = note
        self.subject = subject
        self.createAt = createAt
    }
}
