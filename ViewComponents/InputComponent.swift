import SwiftUI
import SwiftData

struct InputComponent: View {
    var label: String
    var placeholder: String
    @Binding var value: String
    
    var body: some View {
        VStack {
            
        }
    }
}

#Preview {
    @Previewable @State var inputValue: String = ""
    
    InputComponent(label: "Nome", placeholder: "Digite o nome", value: $inputValue)
}
