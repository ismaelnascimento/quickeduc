import SwiftUI
import SwiftData

struct SelectComponent: View {
    var label: String
    var icon: String
    let itens: [String]
    @Binding var valueSelected: Int
    var body: some View {
        HStack {
            Image(systemName: icon).resizable().scaledToFit().frame(width: 20, height: 20).foregroundColor(Color.colorGreen)
            Text(label)
                .font(.system(size: 16, weight: .regular))
                .foregroundColor(.colorText)
                .padding(.leading, 4)
            Spacer()
            Picker(selection: $valueSelected, label: Text(label)) {
                        ForEach(0..<itens.count, id: \.self) {
                            Text(itens[$0])
                      }
            }.accentColor(.colorTextGray)
        }
        .padding(EdgeInsets(top: 0, leading: Sizes.paddingPage, bottom: 0, trailing: Sizes.padding))
        .frame(width: 350, height: 52)
        .background(Color.colorForeground)
        .cornerRadius(Sizes.radius)
    }
}

#Preview {
    @Previewable @State var valueSelected: Int = 0
    
    SelectComponent(label: "Nome", icon: "plus", itens: ["azul", "amarelo"], valueSelected: $valueSelected)
}
