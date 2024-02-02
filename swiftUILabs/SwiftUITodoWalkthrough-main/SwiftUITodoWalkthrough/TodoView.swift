//
//  TodoView.swift
//  SwiftUITodoWalkthrough
//
//  Created by Brayden Lemke on 10/2/23.
//

import SwiftUI

struct TodoView: View {
    @StateObject var todosController = TodosController()
    var body: some View {
        NavigationStack {
            VStack {
                HStack{
                    Text("Todos").font(.title)
                        .padding(.leading, 25)
                    Spacer()
                    
                    NavigationLink {
                        CreateTodoView(todoController: todosController)
                    } label: {
                        Image(systemName: "plus")
                            .font(.title.weight(.thin))
                            .padding(.trailing, 25)
                    }
                }
                .padding()
                .frame(height: 40)
                
                List {
                    ForEach($todosController.sections) { $section in
                        Section(section.sectionTitle) {
                            ForEach($section.todos) { $todo in
                                TodoRowView(todo: $todo)
                            }
                            .onDelete(perform: { indexSet in
                                deleteToDo(at: indexSet, from: section)
                            })
                        }
                    }
                }
                .listStyle(.inset)
            }
            .toolbar(.hidden)
        }
    }
    
    func deleteToDo(at offsets: IndexSet, from section: TodoSection) {
        if let index = todosController.sections.firstIndex(of: section) {
            todosController.sections[index].todos.remove(atOffsets: offsets)
        }
    }
}

struct TodoView_Previews: PreviewProvider {
    static var previews: some View {
        TodoView()
    }
}
