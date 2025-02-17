import SwiftUI
import SwiftData

struct AddActivityView: View {
    @Binding var isShowingSheet: Bool
    @State var title: String = ""
    @State var local: String = ""
    @State var note: String = ""
    
    @State var subjectSelected: Int = 0
    var subjects: [String] = ["Português", "Geografia", "Ciências"]
    
    @State var typeActivitySelected: Int = 0
    var activityTypeList: [String] = [TypeActivity.event, TypeActivity.presentation, TypeActivity.task, TypeActivity.test]
    
    @State var statusSelected: Int = 0
    var statusList: [String] = [StatusActivity.todo, StatusActivity.doing, StatusActivity.done]
    
    @State var date: Date = Date.now
    
    var body: some View {
        NavigationStack {
            VStack(alignment: .leading, spacing: Sizes.padding) {
                SelectComponent(label: "Tipo da atividade", icon: "text.document", itens: activityTypeList, valueSelected: $typeActivitySelected)
                
                SelectComponent(label: "Status", icon: "circle", itens: statusList, valueSelected: $statusSelected)
                
                InputComponent(label: "Título", placeholder: "Digite o título da atividade", value: $title)
                
                MomentSelectorComponent(date: $date)
                
                SelectComponent(label: "Matéria", icon: "book.closed", itens: subjects, valueSelected: $subjectSelected)
                
                InputComponent(label: "Local", placeholder: "Digite o local onde a atividade ocorrerá", value: $local)
                
                TextAreaComponent(label: "Anotação", placeholder: "Digite aqui sua anotação...", value: $note)
                
                Spacer()
            }
            .padding(Sizes.paddingPage)
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                            Button {
                                isShowingSheet = false
                            } label: {
                                Text("Cancelar").foregroundColor(.red)
                            }
                        }

                        ToolbarItem(placement: .principal) {
                            Text("Adicionar atividade")
                                .foregroundColor(.colorText)
                                .bold()
                        }

                        ToolbarItem(placement: .navigationBarTrailing) {
                            Button {
                                
                            } label: {
                                Text("Salvar").bold().foregroundColor(.colorGreen)
                            }
                        }
            }
        }
        
    }
}

#Preview {
    AddActivityView(isShowingSheet: .constant(true))
}
