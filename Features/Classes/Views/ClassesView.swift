import SwiftUI
import SwiftData

struct ClassesView: View {
    //@State var classes: [Class] = []
    //    Class(name: "P4 Informática", subjects: [Subject(title: "Matemática", color: Color.indigo),
    //                                            Subject(title: "Geografia", color: Color.pink),
    //                                           Subject(title: "Português", color: Color.blue)], createAt: Date.now),
    //  Class(name: "P518 Informática", subjects: [Subject(title: "Matemática", color: Color.indigo),
    //                                           Subject(title: "Geografia", color: Color.pink),
    //                                            Subject(title: "Português", color: Color.blue)], createAt: Date.now)
    
    @Environment(\.modelContext) private var modelContext
    
    @Query var classes: [Class]
    
    @State var isShowingClassCreatorSheet: Bool
    @State var isShowingSubjectManagerSheet: Bool
    
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
            .navigationBarItems(trailing: Button{
                isShowingClassCreatorSheet = true
            } label: {
                Image(systemName: "plus.circle")
            }.frame(width: 24, height: 24).foregroundColor(Color.colorGreen).padding(.trailing, Sizes.paddingNavigationBar))
            .navigationBarTitleDisplayMode(.inline)
            .toolbarBackground(Color.colorBackground, for: .navigationBar, .tabBar)
            .toolbarBackground(.visible, for: .navigationBar, .navigationBar)
            
            .sheet(isPresented: $isShowingClassCreatorSheet) {
                ClassCreator(isShowingSheet: $isShowingClassCreatorSheet, isShowingSubjectManagerSheet: $isShowingSubjectManagerSheet)
                    .presentationDetents([.height(300), .large])
            }
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
    
    ClassesView(isShowingClassCreatorSheet: false, isShowingSubjectManagerSheet: false)
}

