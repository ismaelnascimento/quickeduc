import Foundation
import SwiftData

@Model
class User {
    var name: String
    var email: String
    var password: String
    var education: String
    var birthday: String

    init(name: String, email: String, password: String, education: String, birthday: String) {
        self.name = name
        self.email = email
        self.password = password
        self.education = education
        self.birthday = birthday
    }
}
