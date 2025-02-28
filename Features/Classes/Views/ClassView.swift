//
//  SwiftUIView.swift
//  QuickEduc
//
//  Created by found on 04/02/25.
//

import SwiftUI
import SwiftData

struct ClassView: View {
    let classItem: Class
    let justView: Bool?
    @State var isShowingSubjectsSheet: Bool
    @State var concluedManagerSubjects: Bool = false
    
    @Query var classes: [Class]
    
    init(_ classItem: Class, justView: Bool?) {
        self.classItem = classItem
        self.isShowingSubjectsSheet = false
        self.justView = justView
    }
    
    var body: some View {
        HStack{
            if justView != nil && justView == true {
                Image(systemName: "person.3").resizable().scaledToFit().frame(width: 34, height: 34).foregroundColor(Color.colorGreen)
            } else {
                Button {
                    classes.first { $0.isAtual }?.isAtual = false
                    
                    classItem.isAtual.toggle()
                } label: {
                    Image(systemName: !classItem.isAtual ?  "circle" : "checkmark.circle.fill").resizable().scaledToFit().frame(width: 28, height: 28).foregroundColor(Color.colorGreen)
                }
            }
                
            Text(classItem.name)
                    .padding(.leading, 4)
                    .font(.system(size: 22))
                    .fontWeight(Font.Weight.semibold)
            
            
            Spacer()
            
            if justView != nil && justView == true {
            } else {
                Button {
                    isShowingSubjectsSheet = true
                } label: {
                    Image(systemName: "book.closed").resizable().scaledToFit().frame(width: 24, height: 24).foregroundColor(Color.colorGreen)
                }
                .sheet(isPresented: $isShowingSubjectsSheet) {
                    ClassSubjectsManager(classItem: classItem, isShowingSheet: $isShowingSubjectsSheet, concluedManagerSubjects: $concluedManagerSubjects).presentationDetents([.height(700), .large])
                }
            }
        }
        .frame(height: 90)
        .padding(.horizontal, Sizes.padding)
        .background(Color.colorForeground)
        .cornerRadius(Sizes.radius)
        .listRowSeparator(.hidden)
        //.listRowInsets(EdgeInsets())
    }
}

#Preview {
    var subjects = [
        Subject(title: "Matemática", color: Color.indigo),
        Subject(title: "Geografia", color: Color.pink),
        Subject(title: "Português", color: Color.blue)
    ]
    var classes: [Class] = [
        Class(name: "P4 Informática", subjects: subjects, createAt: Date.now, isAtual: false),
        Class(name: "P5 Informática", subjects: subjects, createAt: Date.now, isAtual: false)
    ]
    VStack {
        ClassView(classes[0], justView: false)
        ClassView(classes[1], justView: false)
    }
}
