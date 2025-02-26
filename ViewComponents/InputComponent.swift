import SwiftUI
import SwiftData

struct InputComponent: View {
    var label: String
    var placeholder: String
    @Binding var value: String
    
    var body: some View {
        VStack(alignment: .leading) {
            Text(label)
                .font(.system(size: 14, weight: .medium))
                .foregroundColor(.colorText)
                .padding(.bottom, -4)
            HStack {
                TextField(placeholder, text: $value)
                    .frame(height: 40)
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
    
    InputComponent(label: "Nome", placeholder: "Digite o nome", value: $inputValue)
}
