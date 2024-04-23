//
//  HouseTaskViewModel.swift
//  HouseTaskApp
//
//  Created by aluno06 on 23/04/24.
//

import Foundation

class HouseTaskViewModel: ObservableObject {
    @Published var tasks: [HouseTaskModel] = []
    @Published var doneTasks: [HouseTaskModel] = []
    
    init(){
        basicTasks()
    }
    
    func basicTasks() {
        tasks = [
            HouseTaskModel(name: "Limpar casa", description: "Limpar a louça, banheiros e varrer", completed: false),
            HouseTaskModel(name: "Estender roupas", description: "Pegar todas as roupas da maquina e estender", completed: false),
            HouseTaskModel(name: "Descongelar carnes", description: "Escolher carne do almoço e por para descongelar", completed: false),
        ]
        
        doneTasks = [
            HouseTaskModel(name: "Abastecer", description: "Abastecer o carro no posto", completed: true),
        ]
    }
    
    func doneTask(task: HouseTaskModel){
        if let index = tasks.firstIndex(where: {$0.id == task.id}){
            var completedTask = tasks.remove(at: index)
            completedTask.completed = true
            doneTasks.append(completedTask)
        }
    }
    
    func undoneTask(task: HouseTaskModel){
        if let index = doneTasks.firstIndex(where: {$0.id == task.id}){
            var undoneTask = doneTasks.remove(at: index)
            undoneTask.completed = false
            tasks.append(undoneTask)
        }
    }
    
}
