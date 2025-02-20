//
//  SwiftUIView.swift
//  QuickEduc
//
//  Created by found on 04/02/25.
//

import SwiftUI

struct ClassView: View {
    let classItem: Class
    @State var isShowingSubjectsSheet: Bool
    
    init(_ classItem: Class) {
        self.classItem = classItem
        self.isShowingSubjectsSheet = false
    }
    
    var body: some View {
        HStack{
            Image(systemName: "circle").resizable().scaledToFit().frame(width: 28, height: 28).foregroundColor(Color.colorGreen)
                
            Text(classItem.name)
                    .padding(.leading, 4)
                    .font(.system(size: 22))
                    .fontWeight(Font.Weight.semibold)
            
            
            Spacer()
            
            Button {
                isShowingSubjectsSheet = true
            } label: {
                Image(systemName: "book.closed").resizable().scaledToFit().frame(width: 24, height: 24).foregroundColor(Color.colorGreen)
            }
            .sheet(isPresented: $isShowingSubjectsSheet) {
                ClassSubjectsManager(classItem: classItem, isShowingSheet: $isShowingSubjectsSheet)
            }
            
        }
        .frame(height: 90)
        .padding(.horizontal, Sizes.padding)
        .background(Color.colorForeground)
        .cornerRadius(Sizes.radius)
    }
}

#Preview {
    var subjects = [
        Subject(title: "Matemática", color: Color.indigo),
        Subject(title: "Geografia", color: Color.pink),
        Subject(title: "Português", color: Color.blue)
    ]
    var classes: [Class] = [
        Class(name: "P4 Informática", subjects: subjects, createAt: Date.now),
        Class(name: "P5 Informática", subjects: subjects, createAt: Date.now)
    ]
    VStack {
        ClassView(classes[0])
        ClassView(classes[1])
    }
}
