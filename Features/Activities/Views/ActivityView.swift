//
//  SwiftUIView.swift
//  QuickEduc
//
//  Created by found on 04/02/25.
//

import SwiftUI

struct ActivityView: View {
    let activity: ActivityProtocol
    var color: Color
    @State var status: String
    
    init(_ activity: ActivityProtocol) {
       self.activity = activity
       self.color = activity.subject.colorComponent.color
       status = activity.status
    }

    var body: some View {
        HStack{
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
                        default:
                            "clock"
                        }
                        
                        Image(systemName: iconName
                        
                        ).resizable().scaledToFit().frame(width: 16, height: 16).foregroundColor(.colorTextGray)
                        
                        // pegando a informação correta para cada tipo \\
                        let info = switch activity.type {
                        case TypeActivity.event:
                            activity.local ?? "Não informado"
                        case TypeActivity.presentation:
                            activity.note != nil ? "Há uma anotação" : "Sem anotações"
                            
                        default:
                            String(activity.date.formatted().suffix(5))
                        }
                        // pegando a informação correta para cada tipo \\
                        
                        Text(info).font(.system(size: 14))
                            .foregroundColor(Color.colorTextGray)
                    }
                }.padding(.leading)
                
                Spacer()
                
                VStack(alignment: .trailing){
                    Button {
                        status = status == StatusActivity.todo ?
                        StatusActivity.doing:status == StatusActivity.doing ? StatusActivity.done : StatusActivity.todo
                    } label: {
                        Image(systemName: status == StatusActivity.todo ?
                              "circle": status == StatusActivity.doing ? "hourglass.bottomhalf.filled" :"checkmark.circle").resizable().scaledToFit().frame(width: 24, height: 24).foregroundColor(color)
                    }
                    
                    Spacer()
                    
                    Text(activity.subject.title)
                        .font(.system(size: 14))
                        .padding(.horizontal, 7)
                        .foregroundColor(color)
                        .background(color.quaternary)
                        .cornerRadius(Sizes.radius)
                       
                }
            }
            
        }
        .padding(Sizes.padding)
            .frame(width: 350, height: 100)
            .background(color.quinary)
            .cornerRadius(Sizes.radius)
        
    }
}

#Preview {
    var activities: [ActivityProtocol] = [
        Test(title: "Prova", createAt: Date.now, status: StatusActivity.todo, subject: Subject(title: "Matemática", color: Color.indigo),  type: TypeActivity.test, date: Date.now),
        Event(title: "Evento",  createAt: Date.now, status: StatusActivity.done,subject: Subject(title: "Apple", color: Color.green), local: "Planalto Caucaia",  type: TypeActivity.event, date: Date.now),
        Presentation(title: "Apresentação",  createAt: Date.now, status: StatusActivity.done, subject: Subject(title: "Geografia", color: Color.pink), type: TypeActivity.presentation, date: Date.now),
        Task(title: "Tarefa",  createAt: Date.now, status: StatusActivity.doing,subject: Subject(title: "Português", color: Color.blue), type: TypeActivity.task, date: Date.now),
    ]
    VStack {
        ActivityView(activities[0])
        ActivityView(activities[1])
        ActivityView(activities[2])
        ActivityView(activities[3])
    }
}
