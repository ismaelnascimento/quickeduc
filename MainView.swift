import SwiftUI
import SwiftData

struct MainView: View {
    @State var selection: Int = 2
    
    init() {
        UITabBar.appearance().backgroundColor = UIColor(Color.colorGreenPastel)
    }
    
    var body: some View {
        TabView(selection: $selection) {
            ProfileView()
                
                        .tabItem {
                            Label("Perfil", systemImage: "person")
                        }.tag(1)
            
            ActivitiesView()
                        .tabItem {
                            Label("Atividades", systemImage: "calendar")
                        }.tag(2)


            NotesView()
                        .tabItem {
                            Label("Anotações", systemImage: "square.and.pencil")
                        }.tag(3)
                        
        }.accentColor(Color.colorGreen).onAppear {
            selection = 2
        }
    }
}


//#Preview {
//    MainView()
//}
