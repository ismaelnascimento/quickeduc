import SwiftUI
import SwiftData

@main
struct MyApp: App {
    var body: some Scene {
        WindowGroup {
            MainView()
                .accentColor(Color.colorGreen)
                .modelContainer(for: [Class.self, Activity.self])
        }
    }
}
