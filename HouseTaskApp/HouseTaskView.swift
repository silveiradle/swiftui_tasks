//
//  HouseTaskApp.swift
//  HouseTaskApp
//
//  Created by aluno06 on 23/04/24.
//

import SwiftUI

struct HouseTaskView: View {
    @ObservedObject var houseTasks: HouseTaskViewModel
    @State var showModal = false
    
    var body: some View {
            VStack(alignment: .leading) { 
                
                HStack {
                    Text("Confira suas tarefas")
                        .bold()
                        .foregroundColor(.secondary)
                    
                    Spacer()
                    
                    Button(action: {
                        showModal.toggle()
                    }, label: {
                        Text("Nova tarefa")
                    })
                     
                }
                
                Text("Tarefas a fazer")
                    .bold()
                    .padding(8)
                    .font(.title2)
                    .foregroundColor(.secondary)
              
                List(houseTasks.tasks) { task in
                    
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
                    }
                    .swipeActions {
                        Button("Completar"){
                            houseTasks.doneTask(task: task)
                        }.tint(.green)
                    }
                    .padding(8)
                }
                .listStyle(.insetGrouped)
                .sheet(isPresented: $showModal, content: {
                    // View para adicionar tarefas
                    Button("Fechar"){
                        showModal.toggle()
                    }
                })
                .navigationTitle("Tarefas APP")
            }
    }
}
//
//#Preview {
//    HouseTaskView()
//}
