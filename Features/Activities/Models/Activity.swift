import Foundation
import SwiftData

@Model
class Activity: ActivityProtocol {
    var title: String
    var createAt: Date
    var status: String
    var subject: Subject?
    var note: String?
    var local: String?
    var type: String // TypeActivity
    var date: Date
    
    func getWeekDay() -> String {
        let weekDays = ["Dom", "Seg", "Ter", "Qua", "Qui", "Sex", "Sáb"]
        let weekDayIndex = Calendar.current.component(.weekday, from: date)
        return weekDays[weekDayIndex - 1]
    }
    
    init(title: String, createAt: Date, status: String, subject: Subject? = nil, note: String? = nil, local: String? = nil, type: String, date: Date) {
        self.title = title
        self.createAt = createAt
        self.status = status
        self.subject = subject
        self.note = note
        self.local = local
        self.type = type
        self.date = date
    }
}
