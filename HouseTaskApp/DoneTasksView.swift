//
//  DoneTasksView.swift
//  HouseTaskApp
//
//  Created by aluno06 on 23/04/24.
//

import SwiftUI

struct DoneTasksView: View {
    @ObservedObject var houseTasks: HouseTaskViewModel
    
    var body: some View {
        VStack(alignment: .leading) {
            Text("Tarefas feitas")
                .bold()
                .padding(8)
                .font(.title2)
                .foregroundColor(.secondary)
            
            List(houseTasks.doneTasks) { task in
                HStack{
                    Text(task.name)
                        .bold()
                    
                    Spacer()
                    
                    RoundedRectangle(cornerRadius: 4)
                        .overlay(Text(task.completed ? "Completa" : "Incompleta")
                            .foregroundColor(.white)
                            .font(.caption)
                        )
                        .foregroundColor(task.completed ? .green : .red)
                        .frame(width: 90, height: 24)
                }.swipeActions {
                    Button("Desfazer"){
                        houseTasks.undoneTask(task: task)
                    }.tint(.red)
                }
                .listStyle(.insetGrouped)
                .padding(8)
            }
            .navigationTitle("Tarefas APP")
        }
    }
}

//#Preview {
//    DoneTasksView()
//}
