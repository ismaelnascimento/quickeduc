import SwiftUI
import SwiftData

struct ActivitiesView: View {
    var groups = ["Seg", "Ter", "Qua", "Qui", "Sex", "Sáb", "Dom"]
    @State var group: String = "Seg"
    
    init() {
        UISegmentedControl.appearance().selectedSegmentTintColor = UIColor(Color.colorGreenPastel)
        UISegmentedControl.appearance().setTitleTextAttributes([.foregroundColor: UIColor(Color.colorText)], for: .selected)
        UISegmentedControl.appearance().setTitleTextAttributes([.foregroundColor: UIColor(Color.colorTextGray)], for: .normal)
    }
    
    var body: some View {
        NavigationStack {
            VStack {
                VStack {
                    HStack(alignment: .center) {
                        Text("Olá, o que vamos \nestudar hoje? ")
                            .fontWeight(.semibold)
                            .font(.system(size: 28))
                        .foregroundColor(.colorText)
                        .frame(height: 68, alignment: .topLeading)
                      Spacer()
                        HStack(alignment: .center) {
                            Image(systemName: "plus").resizable().frame(width: 20, height: 20).foregroundColor(.colorCyan)
                        }
                        .padding(7)
                        .frame(width: 58, height: 58, alignment: .center)
                        .background(Color.colorGreenLight)
                        .cornerRadius(100)
                    }
                    .padding(Sizes.padding)
                    .frame(height: 99, alignment: .bottom)
                    .background(Color.colorGreenPastel)
                    .cornerRadius(Sizes.radius)
                    
                    Picker("Pick A Group", selection: $group) {
                        ForEach(groups, id: \.self) {
                            Text($0)
                        }
                    }
                    .pickerStyle(.segmented)
                    .padding(.top, 10)
                    
                    
                    Spacer()
                }.padding(Sizes.paddingPage)
            }
            .navigationTitle("Esta Semana")
            .navigationBarTitleDisplayMode(.inline)
            .toolbarBackground(Color.colorBackground, for: .navigationBar, .tabBar)
            .toolbarBackground(.visible, for: .navigationBar, .navigationBar)
        }
    }
}

