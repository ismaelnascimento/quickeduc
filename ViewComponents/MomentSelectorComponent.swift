import SwiftUI
import SwiftData

struct MomentSelectorComponent: View {
    @Binding var date: Date
    
    var body: some View {
        HStack {
            Text("Data e hora")
                .font(.system(size: 16))
                .foregroundColor(.colorText)
            DatePicker("", selection: $date)
                .tint(.colorGreen)
        }
        .padding(EdgeInsets(top: 0, leading: Sizes.padding, bottom: 0, trailing: Sizes.padding))
        .frame(width: 350, height: 52)
        .cornerRadius(Sizes.radius)
        .overlay(
            RoundedRectangle(cornerRadius: Sizes.radius)
                .stroke(Color.colorGreen, lineWidth: 1)
        )
    }
        
}

#Preview {
    @Previewable @State var date: Date = Date.now
    
    MomentSelectorComponent(date: $date)
}
