import Foundation
import SwiftData

@Model
class Test: ActivityProtocol {
    var title: String
    var createAt: Date
    var status: String
    var subject: Subject?
    var note: String?
    var local: String?
    var type: String // TypeActivity
    var date: Date
    
    var duration: Int? // In minutes

    init(title: String, createAt: Date, status: String, subject: Subject? = nil, note: String? = nil, local: String? = nil, type: String, date: Date, duration: Int? = nil) {
        self.title = title
        self.createAt = createAt
        self.status = status
        self.subject = subject
        self.note = note
        self.local = local
        self.type = type
        self.date = date
        self.duration = duration
    }
}
