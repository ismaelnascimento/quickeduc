import SwiftUI
import SwiftData

struct SaveActivityView: View {
    @Environment(\.modelContext) var modelContext
    
    @Binding var isShowingSheet: Bool
    
    let activity: Activity?
    
    var editorTitle: String {
        activity == nil ? "Adicionar atividade" : "Editar atividade"
    }
    
    @State var title: String = ""
    @State var local: String = ""
    @State var note: String = ""
    
    @State var subjectSelected: Int = 0
    var subjects: [Subject] = [Subject(title: "Matemática", color: Color.indigo), Subject(title: "Apple", color: Color.green)]
    @State var subjectsStrings: [String] = []
    
    @State var typeActivitySelected: Int = 0
    var activityTypeList: [String] = [TypeActivity.event, TypeActivity.presentation, TypeActivity.task, TypeActivity.test]
    
    @State var statusSelected: Int = 0
    var statusList: [String] = [StatusActivity.todo, StatusActivity.doing, StatusActivity.done]
    
    @State var date: Date = Date.now
    
    func save() {
        let status: String = statusList[statusSelected]
        
        let subject: Subject = subjects[subjectSelected]
        
        let type: String = activityTypeList[typeActivitySelected]
        
        if let activity {
            activity.title = title
            activity.note = note
            activity.local = local
            
            if let indexSubject = subjects.firstIndex(of: activity.subject) {
                subjectSelected = indexSubject
            }
            
            if let indexType = activityTypeList.firstIndex(of: activity.type) {
                typeActivitySelected = indexType
            }
            
            if let indexStatus = statusList.firstIndex(of: activity.status) {
                statusSelected = indexStatus
            }
            
            date = activity.date
            
        } else {
            let activityToAdd: Activity = Activity(title: title, createAt: Date.now, status: status, subject: subject,  type: type, date: date)
            
            if(activityToAdd.title != "") {
                modelContext.insert(activityToAdd)
            }
        }
    }
    
    var body: some View {
        NavigationView {
            VStack(spacing: Sizes.padding) {
                SelectComponent(label: "Tipo da atividade", icon: "text.document", itens: activityTypeList, valueSelected: $typeActivitySelected)
                
                SelectComponent(label: "Status", icon: "circle", itens: statusList, valueSelected: $statusSelected)
                
                InputComponent(label: "Título", placeholder: "Digite o título da atividade", value: $title)
                
                MomentSelectorComponent(date: $date)
                
                SelectComponent(label: "Matéria", icon: "book.closed", itens: subjectsStrings, valueSelected: $subjectSelected)
                
                InputComponent(label: "Local", placeholder: "Digite o local onde a atividade ocorrerá", value: $local)
                
                TextAreaComponent(label: "Anotação", placeholder: "Digite aqui sua anotação...", value: $note)
                
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .top)
            .padding(.horizontal, Sizes.paddingPage)
            .navigationTitle("Adicionar atividade")
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
                    Text(editorTitle)
                        .foregroundColor(.colorText)
                        .bold()
                }
                
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button {
                        withAnimation {
                            save()
                            isShowingSheet = false
                        }
                    } label: {
                        Text("Salvar").bold().foregroundColor(.colorGreen)
                    }
                }
            }
        }.onAppear() {
            subjectsStrings = subjects.map { $0.title }
            
            if let activity {
                title = activity.title
                note = activity.note ?? ""
                local = activity.local ?? ""

                if let indexSubject = subjects.firstIndex(of: activity.subject) {
                    subjectSelected = indexSubject
                }
                
                if let indexType = activityTypeList.firstIndex(of: activity.type) {
                    typeActivitySelected = indexType
                }
                
                if let indexStatus = statusList.firstIndex(of: activity.status) {
                    statusSelected = indexStatus
                }
                
                date = activity.date
            }
        }
        
    }
}

#Preview {
    SaveActivityView(isShowingSheet: .constant(true), activity: nil)
}
