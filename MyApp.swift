import SwiftUI
import SwiftData

@main
struct MyApp: App {
    var body: some Scene {
        WindowGroup {
            MainView()
                .accentColor(Color.colorGreen)
                .modelContainer(for: [Event.self, Task.self,
                                      Test.self,
                                      Presentation.self,
                                      Activity.self,
                                      Subject.self])
        }
        
    }
}
