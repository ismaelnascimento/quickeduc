import SwiftUI
import SwiftData

struct NotesView: View {
    var notes: [Note] = [
        Note(title: "Sobre biologia", note: "Essa é uma revisão para a prova de biologia. Essa é uma revisão para a prova de biologia.", subject: Subject(title: "Biologia", color: .green), createAt: Date.now),

        Note(title: "História Moderna", note: "Resumo sobre a Revolução Francesa e seus impactos na Europa.", subject: Subject(title: "História", color: .blue), createAt: Date.now),

        Note(title: "Equações de 2º grau", note: "Estudo sobre a fórmula de Bhaskara e suas aplicações.", subject: Subject(title: "Matemática", color: .red), createAt: Date.now),

        Note(title: "Gramática Portuguesa", note: "Regras sobre o uso de crase e exemplos práticos.", subject: Subject(title: "Português", color: .yellow), createAt: Date.now),

        Note(title: "Física - Leis de Newton", note: "Explicação das três leis do movimento e exercícios resolvidos.", subject: Subject(title: "Física", color: .purple), createAt: Date.now),

        Note(title: "Química Orgânica", note: "Resumo sobre hidrocarbonetos e reações de combustão.", subject: Subject(title: "Química", color: .orange), createAt: Date.now)
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

