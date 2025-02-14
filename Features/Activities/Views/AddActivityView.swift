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
    
    var activities: [ActivityProtocol] = [
        Test(title: "Prova", subject: Subject(title: "Matemática", color: Color.indigo), createAt: Date.now, status: StatusActivity.todo, type: TypeActivity.test, date: Date.now),
        Event(title: "Evento", subject: Subject(title: "Apple", color: Color.green), createAt: Date.now, local: "Planalto Caucaia", status: StatusActivity.done, type: TypeActivity.event, date: Date.now),
        Presentation(title: "Apresentação", subject: Subject(title: "Geografia", color: Color.pink), createAt: Date.now, status: StatusActivity.done, type: TypeActivity.presentation, date: Date.now),
        Task(title: "Tarefa", subject: Subject(title: "Português", color: Color.blue), createAt: Date.now, status: StatusActivity.doing, type: TypeActivity.task, date: Date.now),
    ]
    
    var body: some View {
        NavigationStack {
            VStack {
                VStack {
                    // Button add
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
                    
                    // Filter day week
                    Picker("Pick A Group", selection: $group) {
                        ForEach(groups, id: \.self) {
                            Text($0)
                        }
                    }
                    .pickerStyle(.palette)
                    .padding(.top, 10)
                    
                    // Activities list
                    
                    VStack {
                        ActivityView(activities[0])
                        ActivityView(activities[1])
                        ActivityView(activities[2])
                        ActivityView(activities[3])
                    }
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

