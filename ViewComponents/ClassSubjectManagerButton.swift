import SwiftUI
import SwiftData

struct ClassSubjectManagerButton: View {
    @Binding var isShowingSheet: Bool
    var titleClass: String
    var classItem: Class
    
    var body: some View {
        VStack(alignment: HorizontalAlignment.leading){
            Text("Quais matérias você quer ver na sua turma?")
                .font(.system(size: 14, weight: .medium))
                .foregroundColor(.colorText)
                .padding(.bottom, -4)
            HStack(){
                Label("", systemImage: "book.closed")
                    .font(.system(size: 30))
                    .foregroundStyle(Color.colorGreen)
                Text("Gerenciar matérias")
                Spacer()
            }
            .onTapGesture {
                isShowingSheet = true
            }
            .padding(Sizes.padding)
            .frame(height: 75)
            .background(Color.colorForeground)
            .cornerRadius(Sizes.radius)
            .sheet(isPresented: $isShowingSheet){
                ClassSubjectsManager(classItem: Class(name: titleClass, subjects:classItem.subjects, createAt: classItem.createAt, isAtual: false), isShowingSheet: $isShowingSheet)
            }
        }
    }
}

