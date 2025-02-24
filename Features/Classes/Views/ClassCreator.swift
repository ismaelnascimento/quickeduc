import SwiftUI
import SwiftData

struct ClassCreator: View {
    
    @Environment(\.modelContext) private var modelContext
    
    @State var title: String = ""
    @Binding var isShowingSheet: Bool
    @Binding var isShowingSubjectManagerSheet: Bool
    @Binding var classes: [Class]
    @State var ghostClass: Class = Class(name: "", subjects:[
        
        Subject(title: "Português", color: .red),
        Subject(title: "Matemática", color: .blue),
        Subject(title: "Biologia", color: .green),
        Subject(title: "História", color: .yellow)
        
    ], createAt: Date.now)
    
    var body: some View {
        
        VStack {
            InputComponent(label: "Título da turma", placeholder: "Digite o título da turma...", value: $title)
                .frame(width: 375)
            ClassSubjectManagerButton(isShowingSheet: $isShowingSubjectManagerSheet, classItem: ghostClass)
                .frame(width: 375)
            Button{
                if title != "" {
                    
                    var newClass = Class(name: title, subjects: ghostClass.subjects, createAt: Date.now)
                    classes.append(newClass)
                    modelContext.insert(newClass)
                    try? modelContext.save()
                    
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


