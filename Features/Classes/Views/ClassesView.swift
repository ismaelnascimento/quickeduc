import SwiftUI
import SwiftData

struct ClassesView: View {
    var classes: [Class] = [
        Class(name: "P4 Informática", subjects: <#T##[Subject]#>, createAt: <#T##Date#>)
    ]
    
    var body: some View {
        NavigationStack {
            VStack {
                ForEach(notes) { note in
                    NoteView(note)
                }
            }
        }
    }
}

