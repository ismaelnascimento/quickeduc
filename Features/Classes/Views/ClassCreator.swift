import SwiftUI
import SwiftData

struct ClassCreator: View {
    
    @Environment(\.modelContext) private var modelContext
    @Query var classes: [Class]
    
    @State var title: String = ""
    @Binding var isShowingSheet: Bool
    @Binding var isShowingSubjectManagerSheet: Bool
    @State var concluedManagerSubjects: Bool = false
    
    @State var ghostClass: Class = Class(name: "", subjects:[
        
        Subject(title: "Português", color: .red),
        Subject(title: "Matemática", color: .blue),
        Subject(title: "Biologia", color: .green),
        Subject(title: "História", color: .yellow)
        
    ], createAt: Date.now, isAtual: false)
    
    func save() {
        if title != "" && concluedManagerSubjects {
            let newClass = Class(name: title, subjects: ghostClass.subjects, createAt: Date.now, isAtual: classes.count == 0 ? true : false)
            
            modelContext.insert(newClass)
            
            ghostClass.subjects = [
                
                Subject(title: "Português", color: .red),
                Subject(title: "Matemática", color: .blue),
                Subject(title: "Biologia", color: .green),
                Subject(title: "História", color: .yellow)
                
            ]
            isShowingSheet = false
            isShowingSubjectManagerSheet = false
        }
    }
    
    var body: some View {
        NavigationView {
            VStack(spacing: Sizes.padding) {
                InputComponent(label: "Título da turma", placeholder: "Digite o título da turma...", value: $title)
                    .frame(width: 350)
                ClassSubjectManagerButton(isShowingSheet: $isShowingSubjectManagerSheet, classItem: ghostClass, concluedManagerSubjects: $concluedManagerSubjects)
                    .frame(width: 350)
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .top)
                .padding(Sizes.padding)
                .navigationTitle("Adicionar turma")
                .navigationBarTitleDisplayMode(.inline)
                .toolbar {
                    ToolbarItem(placement: .navigationBarLeading) {
                        Button {
                            isShowingSheet = false
                        } label: {
                            Text("Cancelar").foregroundColor(.red)
                        }
                    }
                    
                    ToolbarItem(placement: .principal) {
                        Text("Adicionar turma")
                            .foregroundColor(.colorText)
                            .bold()
                    }
                    
                    ToolbarItem(placement: .navigationBarTrailing) {
                        let checkCanSave = title != "" && concluedManagerSubjects
                        Button {
                            withAnimation {
                                save()
                            }
                        } label: {
                            Text("Salvar").bold().opacity(checkCanSave ? 1.0 : 0.5).foregroundColor(checkCanSave ? .colorGreen : .gray)
                        }.disabled(!checkCanSave)
                    }
                }
            }
        
    }
    
}

#Preview {
    ClassCreator(isShowingSheet: .constant(true), isShowingSubjectManagerSheet: .constant(false))
}
