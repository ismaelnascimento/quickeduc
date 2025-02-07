//
//  SwiftUIView.swift
//  QuickEduc
//
//  Created by found on 04/02/25.
//

import SwiftUI

struct ActivityView: View {
    let activity: ActivityProtocol

    init(_ activity: ActivityProtocol) {
       self.activity = activity
    }
    
    var body: some View {
        HStack{
            Image(systemName: IconsActivity.IconActivityByName(name: activity.type)).resizable().scaledToFit().frame(width: 44, height: 44).foregroundColor(activity.subject!.colorComponent.color)
                
            HStack {
                VStack(alignment: .leading){
                    Text(activity.title).font(.system(size: 18)).bold()
                    HStack{
                        Image(systemName: "calendar").resizable().scaledToFit().frame(width: 16, height: 16).foregroundColor(Color.colorTextGray)
                        
                        Text(activity.date.formatted().prefix(5) + ", " + activity.date.formatted().suffix(5)).font(.system(size: 14))
                            .foregroundColor(Color.colorTextGray)
                        
                    }
                    HStack{
                        Image(systemName: "clock").resizable().scaledToFit().frame(width: 16, height: 16).foregroundColor(.colorTextGray)
                        
                        Text(activity.date.formatted().prefix(5) + ", " + activity.date.formatted().suffix(5)).font(.system(size: 14))
                            .foregroundColor(Color.colorTextGray)
                    }
                }.padding(.leading)
                
                Spacer()
                
                VStack(alignment: .trailing){
                    Image(systemName: "checkmark.circle").resizable().scaledToFit().frame(width: 24, height: 24).foregroundColor(.colorGreen)
                    
                    Spacer()
                    
                    Text(activity.subject!.title)
                        .foregroundColor(.colorGreen)
                        .background(Color.colorGreen.tertiary)
                        
                        .cornerRadius(Sizes.radius)
                       
                }
            }
            
        }
        .padding(Sizes.padding)
            .frame(width: 350, height: 100)
            .background(Color.colorGreenPastel)
            .cornerRadius(Sizes.radius)
        
    }
}

#Preview {
    var activities: [ActivityProtocol] = [
        Test(title: "Prova", subject: Subject(title: "Matemática", color: Color.blue), createAt: Date.now, isDone: true, type: TypeActivity.test, date: Date.now),
        Presentation(title: "Apresentação", subject: Subject(title: "Geografia", color: Color.green), createAt: Date.now, isDone: true, type: TypeActivity.presentation, date: Date.now),
        Presentation(title: "Tarefa", subject: Subject(title: "Português", color: Color.yellow), createAt: Date.now, isDone: true, type: TypeActivity.task, date: Date.now),
        Presentation(title: "Evento", subject: Subject(title: "Apple", color: Color.red), createAt: Date.now, isDone: true, type: TypeActivity.event, date: Date.now),
    ]
    VStack {
        ActivityView(activities[0])
        ActivityView(activities[1])
        ActivityView(activities[2])
        ActivityView(activities[3])
    }
}
