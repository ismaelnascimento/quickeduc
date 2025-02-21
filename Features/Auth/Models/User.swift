import Foundation
import SwiftData

@Model
class User {
    var name: String
    var email: String
    private var password: String
    var selectedClass: Class

    init(name: String, email: String, password: String, education: String, birthday: String, selectedClass: Class) {
        self.name = name
        self.email = email
        self.password = password
        self.selectedClass = selectedClass
    }
}
