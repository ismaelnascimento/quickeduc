import Foundation
import SwiftData

@Model
class Assignment: Activity {
    var dueDate: Date?
    var team: String?
    // Calendar.current.date(byAdding: .day, value: 7, to: Date())
    init(title: String, describe: String?, subject: Subject? = nil, note: Note? = nil, teacher: String? = nil, createAt: Date, local: String?, isDone: Bool, type: TypeActivity, dueDate: Date? = nil, team: String? = nil) {
         self.dueDate = dueDate
         self.team = team
         super.init(
            title: title,
            describe: describe,
            subject: subject,
            note: note,
            teacher: teacher,
            createAt: createAt,
            local: local,
            isDone: isDone,
            type: type
         )
    }
}
