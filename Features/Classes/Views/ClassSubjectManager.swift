import SwiftUI
import SwiftData

struct ClassSubjectsManager: View {
    
    @Environment(\.modelContext) private var modelContext
    var classItem: Class
    @Binding var isShowingSheet: Bool
    @State var title: String = ""
    @State var color: Color = Color.colorGreen
    
    var body: some View {
        
        NavigationStack {
            VStack(alignment: HorizontalAlignment.leading){
                
                HStack(alignment: VerticalAlignment.center){
                    InputComponent(label: "Título da matéria", placeholder: "Digite o título da matéria...", value: $title)
                        .frame(width: 225, height: 150)
                        .padding(.bottom, Sizes.padding)
                    ColorPicker("", selection: 	$color)
                    
                    Button {
                        if title != "" {
                            var titleExists: Bool = false
                            for subject in classItem.subjects {
                                if subject.title == title {
                                    titleExists = true
                                }
                            }
                        
                            if !titleExists {
                                let newSubject = Subject(title: title, color: color)
                                classItem.subjects.append(newSubject)
                        }
                    }
                        
                    } label: {
                        Label("", systemImage: "plus.circle")
                    }
                }
                .frame(width: 300, height: 50)
                
                ForEach(classItem.subjects) {subject in
                    
                    HStack {
                        Text(subject.title)
                            .padding(Sizes.padding)
                            .foregroundStyle(subject.colorComponent.color)
                        Spacer()
                        Button{
                            let index = classItem.subjects.firstIndex(of: subject)
                            classItem.subjects.remove(at: index!)
                            modelContext.delete(subject)
                            
                            
                        } label: {
                            Label("", systemImage: "trash")
                        }.foregroundStyle(subject.colorComponent.color)
                            .padding(Sizes.padding - 8)
                    }
                    .frame(width: 300, height: 50)
                    .background(subject.colorComponent.color.quinary)
                    .cornerRadius(Sizes.radius)
                    .overlay(
                        RoundedRectangle(cornerRadius: Sizes.radius)
                            .stroke(subject.colorComponent.color, lineWidth: 0.5)
                    )
                }
            }
        }
        .toolbar{
            ToolbarItem(placement: ToolbarItemPlacement.navigationBarLeading) {
                Button{
                    isShowingSheet = false
                } label: {
                    Text("Cancelar")
                        .foregroundStyle(.red)
                }
            }
            
            ToolbarItem(placement: ToolbarItemPlacement.principal) {
                Text("Gerenciar matérias da turma")
            }
            
        }
    }
}

#Preview {
    
    var subjects: [Subject] = [
        
        Subject(title: "oi", color: .red),
        Subject(title: "matéria", color: .green)
    ]
    
    var classItem = Class(name: "turma do mael", subjects: subjects, createAt: Date.now)
    
    ClassSubjectsManager(classItem: classItem ,isShowingSheet: .constant(true))
}

