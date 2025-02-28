//
//  SwiftUIView.swift
//  QuickEduc
//
//  Created by found on 04/02/25.
//

import SwiftUI

struct ActivityView: View {
    let activity: Activity
    var color: Color
    //    @State var status: String
    
    init(_ activity: Activity) {
        self.activity = activity
        self.color = .colorGreenPastel
        if let subject = activity.subject {
            self.color = subject.colorComponent.color
        }
        //       status = activity.status
    }
    
    @State var isShowingSheetActivity: Bool = false
    
    var body: some View {
        HStack {
            
            Image(systemName: IconsActivity.IconActivityByName(name: activity.type)).resizable().scaledToFit().frame(width: 44, height: 44).foregroundColor(color)
            
            HStack {
                VStack(alignment: .leading){
                    Text(activity.title).font(.system(size: 18)).bold()
                    HStack{
                        Image(systemName: "calendar").resizable().scaledToFit().frame(width: 16, height: 16).foregroundColor(Color.colorTextGray)
                        
                        let info = switch activity.type {
                        case TypeActivity.event:
                            String(activity.date.formatted().prefix(5)) + ", " + String(activity.date.formatted().suffix(5))
                        case TypeActivity.presentation:
                            String(activity.date.formatted().prefix(5)) + ", " + String(activity.date.formatted().suffix(5))
                        default:
                            String(activity.date.formatted().prefix(5))
                        }
                        
                        
                        Text(info).font(.system(size: 14))
                            .foregroundColor(Color.colorTextGray)
                        
                    }
                    HStack{
                        let iconName = switch activity.type {
                            
                        case TypeActivity.event:
                            "location.circle"
                        case TypeActivity.presentation:
                            "note.text"
                        case TypeActivity.task:
                            "note.text"
                        default:
                            "clock"
                        }
                        
                        Image(systemName: iconName
                              
                        ).resizable().scaledToFit().frame(width: 16, height: 16).foregroundColor(.colorTextGray)
                        
                        // pegando a informação correta para cada tipo \\
                        let showNote = activity.note != nil ? activity.note != "" ? activity.note : "Sem anotações"  :  "Sem anotações"
                        let info = switch activity.type {
                        case TypeActivity.event:
                            activity.local != nil ? activity.local != "" ? activity.local : "Não informado" : "Não informado"
                        case TypeActivity.presentation:
                            showNote
                        case TypeActivity.task:
                            showNote
                            
                        default:
                            String(activity.date.formatted().suffix(5))
                        }
                        // pegando a informação correta para cada tipo \\
                        
                        Text(info ?? "").font(.system(size: 14))
                            .foregroundColor(Color.colorTextGray)
                    }
                }.padding(.leading)
                
                Spacer()
                
                VStack(alignment: .trailing){
                    Button {
                        activity.status = activity.status == StatusActivity.todo ?
                        StatusActivity.doing:activity.status == StatusActivity.doing ? StatusActivity.done : StatusActivity.todo
                    } label: {
                        Image(systemName: activity.status == StatusActivity.todo ?
                              "circle": activity.status == StatusActivity.doing ? "hourglass.bottomhalf.filled" :"checkmark.circle").resizable().scaledToFit().frame(width: 24, height: 24).foregroundColor(color)
                    }
                    
                    Spacer()
                    if let subject = activity.subject {
                        Text(subject.title)
                            .font(.system(size: 14))
                            .padding(.horizontal, 7)
                            .foregroundColor(color)
                            .background(color.quaternary)
                            .cornerRadius(Sizes.radius)
                    }
                }
            }
            
        }
        .contentShape(Rectangle())
        .onLongPressGesture {
            isShowingSheetActivity = true
        }
        .onTapGesture {
            withAnimation {
                isShowingSheetActivity = true
            }
        }
        .sheet(isPresented: $isShowingSheetActivity) {
            SaveActivityView(isShowingSheet: $isShowingSheetActivity, activity: activity)
                .presentationDetents([.height(700), .large])
        }
        .padding(Sizes.padding)
        .frame(height: 100)
        .background(color.quinary)
        .cornerRadius(Sizes.radius)
        
        
    }
}

#Preview {
        var activities: [Activity] = [
            Activity(title: "Prova", createAt: Date.now, status: StatusActivity.todo, subject: Subject(title: "Matemática", color: Color.indigo),  note: "", local: "Minha casa", type: TypeActivity.presentation, date: Date.now),
//            Event(title: "Evento",  createAt: Date.now, status: StatusActivity.done,subject: Subject(title: "Apple", color: Color.green), local: "Planalto Caucaia",  type: TypeActivity.event, date: Date.now),
//            Presentation(title: "Apresentação",  createAt: Date.now, status: StatusActivity.done, subject: Subject(title: "Geografia", color: Color.pink), type: TypeActivity.presentation, date: Date.now),
//            Task(title: "Tarefa",  createAt: Date.now, status: StatusActivity.doing,subject: Subject(title: "Português", color: Color.blue), type: TypeActivity.task, date: Date.now),
        ]
        VStack {
            ActivityView(activities[0])
        }
}
