import SwiftUI
import SwiftData

struct ClassCreator: View {
    
    @Environment(\.modelContext) private var modelContext
    @Query var classes: [Class]
    
    @State var title: String = ""
    @Binding var isShowingSheet: Bool
    @Binding var isShowingSubjectManagerSheet: Bool
    
    @State var ghostClass: Class = Class(name: "", subjects:[
        
        Subject(title: "Português", color: .red),
        Subject(title: "Matemática", color: .blue),
        Subject(title: "Biologia", color: .green),
        Subject(title: "História", color: .yellow)
        
    ], createAt: Date.now, isAtual: false)
    
    var body: some View {
        
        VStack {
            InputComponent(label: "Título da turma", placeholder: "Digite o título da turma...", value: $title)
                .frame(width: 375)
            ClassSubjectManagerButton(isShowingSheet: $isShowingSubjectManagerSheet, classItem: ghostClass)
                .frame(width: 375)
            Button{
                if title != "" {
                    let newClass = Class(name: title, subjects: ghostClass.subjects, createAt: Date.now, isAtual: false)
                    
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
            } label: {
                Text("clica em mim!!!!!")
            }
            
        }
        
    }
    
}


