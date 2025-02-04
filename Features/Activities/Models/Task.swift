import Foundation
import SwiftData

@Model
class Task: ActivityProtocol {
    var title: String
    var describe: String?
    var subject: Subject?
    var teacher: String?
    var note: Note?
    var createAt: Date
    var local: String?
    var isDone: Bool
    var type: String
    
    var dueDate: Date
    var team: String?
    // Calendar.current.date(byAdding: .day, value: 7, to: Date())
    
    func show() {
        print("título: \(title)")
        print("descrição: \(describe ?? "vazio")")
        print("matéria: \(subject?.title ?? "vazio")")
        print("teacher: \(teacher ?? "vazio")")
        print("note: \(note?.title ?? "vazio")")
        print("createAt: \(createAt.formatted())")
        print("local: \(local ?? "vazio")")
        print("isDone: \(isDone)")
        print("type: \(type)")
        
        print("data: \(dueDate.formatted())")
        print("team: \(team ?? "vazio")")
    }
    
    init(title: String, describe: String? = nil, subject: Subject? = nil, teacher: String? = nil, note: Note? = nil, createAt: Date, local: String? = nil, isDone: Bool, type: String, dueDate: Date, team: String? = nil) {
        self.title = title
        self.describe = describe
        self.subject = subject
        self.teacher = teacher
        self.note = note
        self.createAt = createAt
        self.local = local
        self.isDone = isDone
        self.type = type
        self.dueDate = dueDate
        self.team = team
    }
}
