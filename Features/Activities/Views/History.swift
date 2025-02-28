import SwiftUI
import SwiftData

struct History: View {
    @Environment(\.modelContext) var modelContext
    
    @Query var activities: [Activity]
    
    @Query private var classes: [Class]
    
    var selectedClass: Class? {
        classes.first { $0.isAtual }
    }
    
    let ActivityTypeFilters: [String] = ["Todos", TypeActivity.event, TypeActivity.presentation, TypeActivity.task, TypeActivity.test]
    @State var activityTypeFilterIndex: Int = 0
    
    @State var subjectFilters: [String] = ["Todos"]
    @State var subjectFilterIndex: Int = 0
    
    @State var statusFilterIndex: Int = 0
    var statusFilters: [String] = ["Todos", StatusActivity.todo, StatusActivity.doing, StatusActivity.done]
    
    var filterActivitiesBySubjects: [Activity] {
        guard let selectedClass = selectedClass else { return activities }
        return activities.filter { activity in
            guard let subjectActivity = activity.subject else { return true }
            return selectedClass.subjects.contains { $0.id == subjectActivity.id }
        }
    }
    
    @State var isShowingSheetActivity: Bool = false
    
    var filterActivitiesBySubjectAndStatusAndType: [Activity] {
        let filterSubject = filterActivitiesBySubjects.filter { activity in
            guard let subjectActivity = activity.subject else { return true }
            
            return (subjectFilterIndex == 0) ? true : subjectActivity.title == subjectFilters[subjectFilterIndex]
        }
        let filterStatus = filterSubject.filter { activity in
            let status = activity.status
            return (statusFilterIndex == 0) ? true : status == statusFilters[statusFilterIndex]
        }
        let filterType = filterStatus.filter { activity in
            let type = activity.type
            return (activityTypeFilterIndex == 0) ? true : type == ActivityTypeFilters[activityTypeFilterIndex]
        }
        return filterType
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
                        if(!filterActivitiesBySubjects.isEmpty) {
                            VStack {
                                SelectComponent(label: "Tipo de atividade", icon: "document", itens: ActivityTypeFilters, valueSelected: $activityTypeFilterIndex)
                                SelectComponent(label: "Matéria", icon: "book", itens: subjectFilters, valueSelected: $subjectFilterIndex)
                                SelectComponent(label: "Status", icon: "circle", itens: statusFilters, valueSelected: $statusFilterIndex)
                            }
                        }
                        
                        VStack(alignment: .center) {
                            if(filterActivitiesBySubjectAndStatusAndType.isEmpty) {
                                Image("WithoutActivityHistory")
                                    .padding(.top, 80)
                            } else {
                                ForEach(filterActivitiesBySubjectAndStatusAndType) { activity in
                                    ActivityView(activity)
                                }
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
                .navigationTitle("Histórico")
                .navigationBarTitleDisplayMode(.inline)
                .toolbarBackground(Color.colorBackground, for: .navigationBar, .tabBar)
                .toolbarBackground(.visible, for: .navigationBar, .navigationBar)
            }
        }.onAppear {
            self.subjectFilters = ["Todas"] + Subject.getSubjectNames(subjects: selectedClass?.subjects ?? [])
        }
    }
}

#Preview {
    
    History()
}
