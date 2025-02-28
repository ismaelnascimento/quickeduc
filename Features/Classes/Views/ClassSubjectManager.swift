import SwiftUI
import SwiftData

struct ClassSubjectsManager: View {
    
    @Environment(\.modelContext) private var modelContext
    var classItem: Class
    @Binding var isShowingSheet: Bool
    @State var title: String = ""
    @State var color: Color = Color.colorGreen
    @Binding var concluedManagerSubjects: Bool
    
    @State var showingAlert = false
    
    @Query var activities: [Activity]
    @Query private var classes: [Class]
    
//    @State var showingAlertDelete = false
    
    var body: some View {
        NavigationView {
            VStack(alignment: HorizontalAlignment.leading){
                if (classItem.name != "") {
                    ClassView(classItem, justView: true)
                        .padding(.vertical, Sizes.padding)
                }
                
                HStack(alignment: VerticalAlignment.center){
                    InputComponent(label: "Título da matéria", placeholder: "Digite o título da matéria...", value: $title)
                        .frame(width: 270, height: 150)
                        .padding(.bottom, Sizes.padding)
                    ColorPicker("", selection: 	$color).padding(.trailing, 6)
                    
                    let checkCanSave = title != ""
                    
                    Button {
                        if (!title.isEmpty) {
                            var titleExists: Bool = false
                            for subject in classItem.subjects {
                                if subject.title == title {
                                    titleExists = true
                                }
                            }
                            
                            if !titleExists {
                                let newSubject = Subject(title: title, color: color)
                                classItem.subjects.append(newSubject)
                                title = ""
                                color = Color.colorGreen
                            } else {
                                showingAlert = true
                            }
                        }
                        
                    } label: {
                        Image(systemName: "plus.circle").resizable().scaledToFit().frame(width: 24, height: 24).opacity(checkCanSave ? 1.0 : 0.5).foregroundColor(checkCanSave ? .colorGreen : .gray)
                    }.disabled(!checkCanSave).alert("A matéria \(title) já existe", isPresented: $showingAlert) {
                        Button("OK", role: .cancel) { }
                    }
                }
                .frame(height: 50)
                .padding(.vertical, Sizes.padding)
                
                ForEach(classItem.subjects) { subject in
                    if let index = classItem.subjects.firstIndex(of: subject) {
                        HStack {
                            Text(classItem.subjects[index].title)
                                .padding(Sizes.padding)
                                .foregroundStyle(subject.colorComponent.color).bold()
                            
                            Spacer()
                            
                            Button {
//                                showingAlertDelete = true
                                classItem.subjects.remove(at: index)
                            } label: {
                                Label("", systemImage: "trash")
                            }.foregroundStyle(classItem.subjects[index].colorComponent.color)
                                .padding(Sizes.padding - 8)
                            //                            .alert("Tem certeza que deseja deletar a matéria \(classItem.subjects[index].title)?", isPresented: $showingAlertDelete) {
                            //                                Button {
                            //                                } label: {
                            //                                    Text("Cancelar")
                            //                                }
                            //                                Button {
                            //                                        classItem.subjects.remove(at: index)
                            //
                            //                                } label: {
                            //                                    Text("Sim")
                            //                                }
                            //                            } message: {
                            //                                Text("Ao deletar essa matéria, todas as atividades associadas a essa matéria não serão mais visualizadas")
                            //                            }
                        }
                        .frame(height: 50)
                        .background(classItem.subjects[index].colorComponent.color.quinary)
                        .cornerRadius(Sizes.radius)
                        .overlay(
                            RoundedRectangle(cornerRadius: Sizes.radius)
                                .stroke(classItem.subjects[index].colorComponent.color, lineWidth: 0.5)
                        )
                    }
                    
                }
            }.padding(.horizontal, Sizes.paddingPage)
                .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .top)
                .navigationTitle("Gerenciar matérias")
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
                        Text("Gerenciar matérias")
                            .foregroundColor(.colorText)
                            .bold()
                    }
                    
                    ToolbarItem(placement: .navigationBarTrailing) {
                        Button {
                            withAnimation {
                                concluedManagerSubjects = true
                                isShowingSheet = false
                            }
                        } label: {
                            Text("Pronto").bold().foregroundColor(.colorGreen)
                        }
                    }
                }
        }
        
        
    }
}

#Preview {
    
    var subjects: [Subject] = [
        Subject(title: "oi", color: .red),
        Subject(title: "matéria", color: .green)
    ]
    
    var classItem = Class(name: "turma do mael", subjects: subjects, createAt: Date.now, isAtual: false)
    
    ClassSubjectsManager(classItem: classItem ,isShowingSheet: .constant(true), concluedManagerSubjects: .constant(false))
}

