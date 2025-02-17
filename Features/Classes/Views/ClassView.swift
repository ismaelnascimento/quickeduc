//
//  SwiftUIView.swift
//  QuickEduc
//
//  Created by found on 04/02/25.
//

import SwiftUI

struct NoteView: View {
    let note: Note
    
    init(_ note: Note) {
       self.note = note
        
    }

    var body: some View {
        HStack{
            VStack(alignment: .leading){
                Text(note.title)
                    .padding(.top, 10)
                    .padding(.leading, 10)
                    .font(.system(size: 25))
                    .fontWeight(Font.Weight.semibold)
                Text(note.note)
                    .padding(.horizontal, 10)
                    .padding(.bottom, 10)
                    .lineLimit(2)
                    .foregroundStyle(Color.colorTextGray)
                    
                    
            }
            
            VStack(alignment: .trailing) {
                Text(note.createAt.formatted(date: Date.FormatStyle.DateStyle.abbreviated, time: Date.FormatStyle.TimeStyle.omitted))
                    .font(.system(size: 14))
                    .padding(Sizes.padding)
                    .foregroundColor(.colorTextGray)
                
                Spacer()
                Text(note.subject.title)
                
                    .font(.system(size: 14))
                    .padding(.horizontal, 7)
                    
                    .foregroundColor(note.subject.colorComponent.color)
                    .background(note.subject.colorComponent.color.quaternary)
                    .cornerRadius(Sizes.radius)
                    .padding(Sizes.padding)
                   
            }
        }
        .frame(width: 350, height: 100)
        .background(note.subject.colorComponent.color.quaternary)
        .cornerRadius(Sizes.radius)
    }
}

#Preview {
    var notes: [Note] = [
        Note(title: "Sobre biologia", note: "Essa é uma revisão para a prova de biologia. Essa é uma revisão para a prova de biologia.", subject: Subject(title: "biologia", color: .green), createAt: Date.now)
    ]
    VStack {
        NoteView(notes[0])
    }
}
