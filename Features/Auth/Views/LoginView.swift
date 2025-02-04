import SwiftUI
import SwiftData

struct LoginView: View {
    var body: some View {
        NavigationStack {
                Section {
                    Rectangle().frame(width: 100, height: 100).background(Color.colorGreenPastel).opacity(0.1).cornerRadius(Sizes.radius)
                    
                    Text("Bem vindo!")
                        .font(.title2)
                        .foregroundColor(Color.colorGreen)
                        .bold()
                        .padding()
                }
        }
    }
}
