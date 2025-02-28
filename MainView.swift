import SwiftUI
import SwiftData

struct MainView: View {
    init() {
        UITabBar.appearance().backgroundColor = UIColor(Color.colorGreenPastel)
    }
    
    @Query private var classes: [Class]
    
    var selectedClass: Class? {
        classes.first { $0.isAtual }
    }
    
    @State var isShowingSubjectManagerSheet: Bool = false
    
    var body: some View {
        if (selectedClass != nil) {
            TabView() {
                ActivitiesView()
                            .tabItem {
                                Label("Atividades", systemImage: "calendar")
                            }
                
                History()
                            .tabItem {
                                Label("Histórico", systemImage: "clock")
                            }


                ClassesView(isShowingClassCreatorSheet: false, isShowingSubjectManagerSheet: false)
                            .tabItem {
                                Label("Turmas", systemImage: "person.3")
                            }
                            
            }.accentColor(Color.colorGreen)
                .onAppear() {
                    UITabBar.appearance().backgroundColor = UIColor(Color.colorGreenPastel)
                }
        } else {
            NavigationStack {
                Tellus(isShowingSheet: .constant(true), isShowingSubjectManagerSheet: $isShowingSubjectManagerSheet)
            }
        }
    }
}


//#Preview {
//    MainView()
//}
