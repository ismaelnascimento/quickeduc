import Foundation
import SwiftData

protocol ActivityProtocol {
    var title: String { get set }
    var createAt: Date { get set }
    var status: String { get set }
    var subject: Subject { get set }
    var note: String? { get set }
    var local: String? { get set }
    var type: String { get set } // TypeActivity
    var date: Date { get set }
}
