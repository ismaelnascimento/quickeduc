import Foundation
import SwiftData
import SwiftUI

struct ColorComponents: Codable {
    let red: Float
    let green: Float
    let blue: Float
    
    var color: Color {
        Color(red: Double(red), green: Double(green), blue: Double(blue))
    }
    
    static func fromColor(_ color:Color) -> ColorComponents{
        let resolved = color.resolve(in: EnvironmentValues())
        return ColorComponents(
            red: resolved.red,
            green: resolved.green,
            blue: resolved.blue
        )
    }
}

@Model
class Subject {
    
    var title: String
    var colorComponent: ColorComponents
    
    init(title: String,
         color: Color
    ) {
        self.title = title
        self.colorComponent = ColorComponents.fromColor(color)
    }
    
}
