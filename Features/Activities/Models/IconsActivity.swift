import Foundation
import SwiftData

struct IconsActivity {
    static let task = "pencil.line"
    static let test = "text.document"
    static let presentation = "person.crop.rectangle"
    static let event = "graduationcap"
    
    static func IconActivityByName(name: String) -> String {
        if (name == TypeActivity.event) {
            return IconsActivity.event
        } else if (name == TypeActivity.presentation) {
            return IconsActivity.presentation
        } else if (name == TypeActivity.task) {
            return IconsActivity.task
        } else {
            return IconsActivity.test
        }
    }
}
