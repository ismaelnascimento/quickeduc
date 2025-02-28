import SwiftUI
import SwiftData

struct Tellus: View {
    
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
        NavigationStack {
            VStack(spacing: Sizes.padding) {
                Image("Logo").resizable().frame(width: 174, height: 174).cornerRadius(.infinity)
                Text("Personalize").font(.system(size: 36, weight: .semibold))
                    .foregroundColor(.colorText)
                    
                Text("Seu QuickEduc").padding(.top, -15).font(.system(size: 24, weight: .regular))
                    .foregroundColor(.colorText)
                    .padding(.bottom, 20)
                
                InputComponent(label: "Turma", placeholder: "Digite o título da sua turma...", value: $title)
                    .frame(width: 350)
                ClassSubjectManagerButton(isShowingSheet: $isShowingSubjectManagerSheet, classItem: ghostClass, concluedManagerSubjects: $concluedManagerSubjects)
                    .frame(width: 350)
                
                Spacer()
                
                let checkCanSave = title != "" && concluedManagerSubjects
                
                Button {
                    withAnimation {
                        save()
                    }
                } label: {
                    Text("Vamos lá").font(.system(size: 17, weight: .semibold))
                        .foregroundColor(.colorText)
                }.frame(maxWidth: .infinity)
                    .padding(Sizes.padding).foregroundColor( .colorText).background(Color.colorGreenPastel
                    ).cornerRadius(Sizes.radius).opacity(checkCanSave ? 1.0 : 0.5).disabled(!checkCanSave)
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .top)
            .padding(Sizes.paddingPage)
            
        }
        
    }
    
}

#Preview {
    Tellus(isShowingSheet: .constant(true), isShowingSubjectManagerSheet: .constant(false))
}
