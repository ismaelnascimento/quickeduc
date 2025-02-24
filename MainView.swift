import SwiftUI
import SwiftData

struct MainView: View {
    
    init() {
        UITabBar.appearance().backgroundColor = UIColor(Color.colorGreenPastel)
    }
    
    var body: some View {
        TabView() {
            
            ActivitiesView()
                        .tabItem {
                            Label("Atividades", systemImage: "calendar")
                        }


            ClassesView(isShowingClassCreatorSheet: false, isShowingSubjectManagerSheet: false)
                        .tabItem {
                            Label("Turmas", systemImage: "person.3")
                        }
                        
        }.accentColor(Color.colorGreen)
            .onAppear() {
                UITabBar.appearance().backgroundColor = UIColor(Color.colorGreenPastel)
            }
    }
}


//#Preview {
//    MainView()
//}
