import SwiftUI
import SwiftData

struct ActivitiesView: View {
    @Environment(\.modelContext) var modelContext
    
    let weekDays = ["Seg", "Ter", "Qua", "Qui", "Sex", "Sáb"]
    let weekDaysComplete = ["segunda", "terça", "quarta", "quinta", "sexta", "sábado"]
    @State var weekDay: String = "Seg"
    
    
    @Query var activities: [Activity]
    
    @Query private var classes: [Class]
    
    var selectedClass: Class? {
        classes.first { $0.isAtual }
    }
    
    var filterActivitiesBySubjects: [Activity] {
        guard let selectedClass = selectedClass else { return activities }
        return activities.filter { activity in
            guard let subjectActivity = activity.subject else { return true }
            return selectedClass.subjects.contains { $0.id == subjectActivity.id }
        }
    }
    
    @State var isShowingSheetActivity: Bool = false
    
    var filteredActivities: [Activity] {
        filterActivitiesBySubjects.filter {
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
            let weekTodayIndex = Calendar.current.component(.weekday, from: Date.now)
            let today = weekDays[weekTodayIndex - 2]
            
            List {
                Section {
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
                    
                    .padding(.top, 10)
                }
                .buttonStyle(.plain)
                .listRowSeparator(.hidden)
                
                
                Section {
                    // Filter day week
                    Picker("Pick A Group", selection: $weekDay) {
                        ForEach(weekDays, id: \.self) {
                            Text($0)
                            
                        }
                    }
                    .pickerStyle(.palette)
                }
                .buttonStyle(.plain)
                .listRowSeparator(.hidden)
                
                
                // Activities list
                
                Section {
                    if(filteredActivities.isEmpty) {
                        Image("WithoutActivity")
                            .padding(.top, 80)
                            .listRowSeparator(.hidden)
                            .buttonStyle(.plain)
                            .frame(width: 350)
                    } else {
                        ForEach(filteredActivities) { activity in
                            if let index = activities.firstIndex(of: activity) {
                                ActivityView(activity)
                                    .listRowSeparator(.hidden)
                                    .buttonStyle(.plain)
                                    .listRowInsets(EdgeInsets(top: 5.0, leading: Sizes.padding, bottom: 5.0, trailing: Sizes.padding))
                                    .swipeActions(edge: .trailing, allowsFullSwipe: false) {
                                        Button(role: .destructive) {
                                            modelContext.delete(activities[index])
                                        } label: {
                                            Label("", systemImage: "trash")
                                        }
                                    }
                            }
                            //                                .padding(.top, 10)
                            
                            
                        }
                    }
                }
                .frame(alignment: .center)
                .padding(.top, 5)
                
                //Spacer()
            }.onAppear() {
                weekDay = today
            }
            .listStyle(.plain)
            //.padding(Sizes.paddingPage)
            
            .sheet(isPresented: $isShowingSheetActivity) {
                SaveActivityView(isShowingSheet: $isShowingSheetActivity, activity: nil)
                    .presentationDetents([.height(700), .large])
            }
            .navigationTitle("Esta Semana")
            .navigationBarTitleDisplayMode(.inline)
            .toolbarBackground(Color.colorBackground, for: .navigationBar, .tabBar)
            .toolbarBackground(.visible, for: .navigationBar, .navigationBar)
        }
    }
}

#Preview {
    
    ActivitiesView()
}
