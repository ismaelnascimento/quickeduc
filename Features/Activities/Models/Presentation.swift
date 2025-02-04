import Foundation
import SwiftData

@Model
class Presentation: ActivityProtocol {
    var title: String
    var describe: String?
    var subject: Subject?
    var teacher: String?
    var note: Note?
    var createAt: Date
    var local: String?
    var isDone: Bool
    var type: String
    
    var date: Date
    var team: String?
    
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
        
        print("data: \(date.formatted())")
        print("team: \(team ?? "vazio")")
    }
    
    init(title: String, describe: String? = nil, subject: Subject? = nil, teacher: String? = nil, note: Note? = nil, createAt: Date, local: String? = nil, isDone: Bool, type: String, date: Date, team: String? = nil) {
        self.title = title
        self.describe = describe
        self.subject = subject
        self.teacher = teacher
        self.note = note
        self.createAt = createAt
        self.local = local
        self.isDone = isDone
        self.type = type
        self.date = date
        self.team = team
    }
}
