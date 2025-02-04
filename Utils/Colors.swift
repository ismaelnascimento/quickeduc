import Foundation
import SwiftUI
import UIKit

extension Color {
    init(hex: UInt, alpha: Double = 1) {
        self.init(
            .sRGB,
            red: Double((hex >> 16) & 0xff) / 255,
            green: Double((hex >> 08) & 0xff) / 255,
            blue: Double((hex >> 00) & 0xff) / 255,
            opacity: alpha
        )
    }
    // PRIMARY
    static let colorGreen = Color(hex: 0x46A735)
    static let colorGreenLight = Color(hex: 0xEDFFEC)
    static let colorCyan = Color(hex: 0x3E938C)
    static let colorRed = Color(hex: 0xBB3B2F)
    static let colorGreenPastel = Color(hex: 0xC8D8A7)
    static let colorRedPastel = Color(hex: 0xFFAFA8)
    // BACKGROUND
    static let colorBackground = Color(hex: 0xFFFFFF)
    static let colorForeground = Color(hex: 0xF7F7F7)
    // TEXT
    static let colorText = Color(hex: 0x070907)
    static let colorText60 = Color(hex: 0x101110)
    static let colorTextGray = Color(hex: 0x7A8079)
}
