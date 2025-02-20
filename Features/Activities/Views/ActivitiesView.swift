import SwiftUI
import SwiftData

struct ActivitiesView: View {
    @Environment(\.modelContext) var modelContext
    
    let weekDays = ["Seg", "Ter", "Qua", "Qui", "Sex", "Sáb"]
    @State var weekDay: String = "Seg"
    
    var activities: [Activity] = [
        Activity(title: "Prova", createAt: Date.now, status: StatusActivity.todo, subject: Subject(title: "Matemática", color: Color.indigo),  type: TypeActivity.test, date: Date.now),
        Activity(title: "Evento",  createAt: Date.now, status: StatusActivity.done,subject: Subject(title: "Apple", color: Color.green), local: "Planalto Caucaia",  type: TypeActivity.event, date: Date.now),
        Activity(title: "Apresentação",  createAt: Date.now, status: StatusActivity.done, subject: Subject(title: "Geografia", color: Color.pink), type: TypeActivity.presentation, date: Date.now),
        Activity(title: "Tarefa",  createAt: Date.now, status: StatusActivity.doing,subject: Subject(title: "Português", color: Color.blue), type: TypeActivity.task, date: Date.now),
    ]
    
    //    @Query var activities: [Activity]
    
    @State var isShowingSheetActivity: Bool = false
    
    var filteredActivities: [Activity] {
        activities.filter {
            $0.getWeekDay() == weekDay && Calendar.current.isDateInThisWeek($0.date)
        }
    }
    
    init() {
        UISegmentedControl.appearance().selectedSegmentTintColor = UIColor(Color.colorGreenPastel)
        UISegmentedControl.appearance().setTitleTextAttributes([.foregroundColor: UIColor(Color.colorText)], for: .selected)
        UISegmentedControl.appearance().setTitleTextAttributes([.foregroundColor: UIColor(Color.colorTextGray)], for: .normal)
    }
    
    var body: some View {
        NavigationStack {
            ScrollView(.vertical) {
                VStack {
                    VStack {
                        // Button add activity
                        Button {
                            isShowingSheetActivity = true
                        } label: {
                            HStack(alignment: .center) {
                                Text("Olá, o que vamos\nestudar hoje? ")
                                    .fontWeight(.semibold)
                                    .font(.system(size: 28))
                                    .foregroundColor(.colorText)
                                    .multilineTextAlignment(.leading)
                                    .frame(height: 68, alignment: .leading)
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
                        }
                        
                        
                        // Filter day week
                        Picker("Pick A Group", selection: $weekDay) {
                            ForEach(weekDays, id: \.self) {
                                Text($0)
                            }
                        }
                        .pickerStyle(.palette)
                        .padding(.top, 10)
                        
                        // Activities list
                        
                        VStack {
                            ForEach(filteredActivities) { activity in
                                ActivityView(activity)
                            }
                        }
                        .padding(.top, 10)
                        
                        Spacer()
                    }.padding(Sizes.paddingPage)
                }
                .sheet(isPresented: $isShowingSheetActivity) {
                    SaveActivityView(isShowingSheet: $isShowingSheetActivity, activity: nil)
                        .presentationDetents([.height(700), .large])
                }
                .navigationTitle("Esta Semana")
                .navigationBarTitleDisplayMode(.inline)
                .toolbarBackground(Color.colorBackground, for: .navigationBar, .tabBar)
                .toolbarBackground(.visible, for: .navigationBar, .navigationBar)
            }.onAppear() {
                let weekTodayIndex = Calendar.current.component(.weekday, from: Date.now)
                weekDay = weekDays[weekTodayIndex - 2]
            }
        }
    }
}

#Preview {
    
    ActivitiesView()
}
