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
            Image(systemName: IconsActivity.IconActivityByName(name: activity.type)).resizable().scaledToFit().frame(width: 44, height: 44).foregroundColor(.colorGreen)
                
            HStack {
                VStack(alignment: .leading){
                    Text(activity.title).font(.system(size: 18)).bold()
                    HStack{
                        Image(systemName: "calendar").resizable().scaledToFit().frame(width: 16, height: 16).foregroundColor(.colorGreen)
                        
                        Text(activity.date.formatted()).font(.system(size: 14))
                        
                    }
                    HStack{
                        Image(systemName: "clock").resizable().scaledToFit().frame(width: 16, height: 16).foregroundColor(.colorGreen)
                        
                        Text(activity.date.formatted()).font(.system(size: 14))
                    }
                }.padding(.leading)
                
                Spacer()
                
                VStack(alignment: .trailing){
                    Image(systemName: "checkmark.circle").resizable().scaledToFit().frame(width: 24, height: 24).foregroundColor(.colorGreen)
                    
                    Spacer()
                    
                    Text(activity.subject!.title)
                       
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
        Test(title: "Prova", subject: Subject(title: "Matemática"), createAt: Date.now, isDone: true, type: TypeActivity.test, date: Date.now),
        Presentation(title: "Apresentação", subject: Subject(title: "Matemática"), createAt: Date.now, isDone: true, type: TypeActivity.presentation, date: Date.now),
        Presentation(title: "Tarefa", subject: Subject(title: "Matemática"), createAt: Date.now, isDone: true, type: TypeActivity.task, date: Date.now),
        Presentation(title: "Evento", subject: Subject(title: "Apple"), createAt: Date.now, isDone: true, type: TypeActivity.event, date: Date.now),
    ]
    VStack {
        ActivityView(activities[0])
        ActivityView(activities[1])
        ActivityView(activities[2])
        ActivityView(activities[3])
    }
}
