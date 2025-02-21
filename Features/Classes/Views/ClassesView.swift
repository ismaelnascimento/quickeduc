import SwiftUI
import SwiftData

struct ClassesView: View {
    @Environment(\.modelContext) private var modelContext
    
//    var classes: [Class] = [
//        Class(name: "P4 Informática", subjects: [Subject(title: "Matemática", color: Color.indigo),
//                                                 Subject(title: "Geografia", color: Color.pink),
//                                                 Subject(title: "Português", color: Color.blue)], createAt: Date.now, isAtual: true),
//        Class(name: "P518 Informática", subjects: [Subject(title: "Matemática", color: Color.indigo),
//                                                   Subject(title: "Geografia", color: Color.pink),
//                                                   Subject(title: "Português", color: Color.blue)], createAt: Date.now, isAtual: false)
//    ]
//
    
    @Query private var classes: [Class]
    
    @State var isShowingSubjectsSheet: Bool
    @State var classSelected: Class?
    
    func deleteClass(at index: Int) {
        modelContext.delete(classes[index])
    }
    
    var body: some View {
        NavigationStack {
            VStack {
                VStack {
                    ForEach(classes.indices, id: \.self) { index in
                            ClassView(classes[index], justView: false)
                            .listRowSeparator(.hidden)
                            .swipeActions(edge: .trailing, allowsFullSwipe: false) {
                                            Button(role: .destructive) {
                                                deleteClass(at: index)
                                            } label: {
                                                Label("", systemImage: "trash")
                                            }
                                        }
                    }
                    Spacer()
                }.padding(Sizes.padding)
                //.listStyle(.plain)
            }
            .navigationTitle("Turmas")
            .navigationBarItems(trailing: Button  {
                modelContext.insert(Class(name: "P6 Informática", subjects: [Subject(title: "Web 1", color: Color.indigo),
                                                                             Subject(title: "Web 2", color: Color.pink),
                                                                             Subject(title: "Segurança", color: Color.blue)], createAt: Date.now, isAtual: false))
            }label: {
                Image(systemName: "plus.circle").resizable().scaledToFit().frame(width: 24, height: 24).foregroundColor(Color.colorGreen).padding(.trailing, Sizes.paddingNavigationBar)
            }
                )
            .navigationBarTitleDisplayMode(.inline)
            .toolbarBackground(Color.colorBackground, for: .navigationBar, .tabBar)
            .toolbarBackground(.visible, for: .navigationBar, .navigationBar)
            
        }
    }
}

#Preview {
    var p4Subjects: [Subject] = [
        Subject(title: "Apple", color: Color.red),
        Subject(title: "MFDS", color: Color.gray)
    ]
    
    var p5Subjects: [Subject] = [
        Subject(title: "Huawei", color: Color.red),
        Subject(title: "Química", color: Color.purple)
    ]
    
    var classes = [
        Class(name: "Info p4", subjects: p4Subjects, createAt: Date.now, isAtual: false),
        Class(name: "Info p5", subjects: p5Subjects, createAt: Date.now, isAtual: false)
    ]
    
    ClassesView(isShowingSubjectsSheet: false)
}

