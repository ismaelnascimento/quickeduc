import Foundation
import SwiftData

@Model
class Note {
    var title: String
    var note: String
    var subject: Subject
    
    init(title: String, note: String, subject: Subject) {
        self.title = title
        self.note = note
        self.subject = subject
    }
}
