import SwiftUI
import SwiftData

struct TextAreaComponent: View {
    var label: String
    var placeholder: String
    @Binding var value: String
    
    var body: some View {
        VStack(alignment: .leading) {
            Text(label)
                .font(.system(size: 14, weight: .medium))
                .foregroundColor(.colorText)
                .padding(.bottom, -6)
            HStack {
                TextEditor(text: self.$value.max(300))
                    .scrollContentBackground(.hidden)
                        .background(Color.colorForeground)
                        .padding(8)
                        .tint(.colorGreen)
                    .frame(height: 120)
                    .foregroundColor(Color.colorText)
                      .font(.system(size: 14))
                      .multilineTextAlignment(.leading)
            }.background(Color.colorForeground)
            .cornerRadius(Sizes.radius)
        }
    }
}

#Preview {
    @Previewable @State var inputValue: String = ""
    
    TextAreaComponent(label: "Nome", placeholder: "Digite o nome", value: $inputValue)
}
