import SwiftUI
import SwiftData

struct ClassesView: View {
    var classes: [Class] = [
        Class(name: "P4 Informática", subjects: [Subject(title: "Matemática", color: Color.indigo),
                                                 Subject(title: "Geografia", color: Color.pink),
                                                 Subject(title: "Português", color: Color.blue)], createAt: Date.now),
        Class(name: "P518 Informática", subjects: [Subject(title: "Matemática", color: Color.indigo),
                                                 Subject(title: "Geografia", color: Color.pink),
                                                 Subject(title: "Português", color: Color.blue)], createAt: Date.now)
    ]
    
    var body: some View {
        NavigationStack {
            VStack {
                VStack {
                    ForEach(classes) { classItem in
                        ClassView(classItem)
                    }
                    Spacer()
                }.padding(Sizes.paddingPage)
            }
            .navigationTitle("Turmas")
            .navigationBarItems(trailing: Image(systemName: "plus.circle").resizable().scaledToFit().frame(width: 24, height: 24).foregroundColor(Color.colorGreen).padding(.trailing, Sizes.paddingNavigationBar))
                .navigationBarTitleDisplayMode(.inline)
                .toolbarBackground(Color.colorBackground, for: .navigationBar, .tabBar)
                .toolbarBackground(.visible, for: .navigationBar, .navigationBar)
        }
    }
}

