import Foundation
import SwiftData

protocol ActivityProtocol {
    var title: String { get set }
    var describe: String? { get set }
    var createAt: Date { get set }
    var isDone: Bool { get set }
    var subject: Subject? { get set }
    var teacher: String? { get set }
    var note: Note? { get set }
    var local: String? { get set }
    var type: String { get set } // TypeActivity
    var date: Date { get set }
    func show()
}
