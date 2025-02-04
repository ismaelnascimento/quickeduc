import Foundation
import SwiftData

@Model
class Activity {
    var title: String
    var describe: String?
    var subject: Subject?
    var teacher: String?
    var note: Note?
    var createAt: Date
    var local: String?
    var isDone: Bool
    var type: String
    
    init(title: String, describe: String?, subject: Subject? = nil, note: Note? = nil, teacher: String? = nil, createAt: Date, local: String?, isDone: Bool, type: String) {
        self.title = title
        self.describe = describe
        self.subject = subject
        self.teacher = teacher
        self.createAt = createAt
        self.note = note
        self.local = local
        self.isDone = isDone
        self.type = type
    }
}
