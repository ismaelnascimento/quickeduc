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
                TextEditor(text: $value)
                    .frame(height: 100)
                    .padding(EdgeInsets(top: 0, leading: Sizes.padding, bottom: 0, trailing: Sizes.padding))
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
