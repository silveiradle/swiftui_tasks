//
//  HouseTaskAppApp.swift
//  HouseTaskApp
//
//  Created by aluno06 on 23/04/24.
//

import SwiftUI

@main
struct HouseTaskAppApp: App {
    @ObservedObject var vm: HouseTaskViewModel = HouseTaskViewModel()
    
    var body: some Scene {
        WindowGroup {
            TabView {
                NavigationStack{
                    HouseTaskView(houseTasks: vm)
                }
                .tabItem {
                    Label("Inicio", systemImage: "house")
                }
                
                NavigationStack {
                    DoneTasksView(houseTasks: vm)
                }
                    .tabItem {
                        Label("Completas", systemImage: "checkmark.circle")
                    }
            }.preferredColorScheme(/*@START_MENU_TOKEN@*/.dark/*@END_MENU_TOKEN@*/)
        }
    }
}
