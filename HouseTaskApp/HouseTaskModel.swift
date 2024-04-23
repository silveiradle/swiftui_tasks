//
//  HouseTaskModel.swift
//  HouseTaskApp
//
//  Created by aluno06 on 23/04/24.
//

import Foundation

struct HouseTaskModel: Identifiable {
    var id: UUID = UUID()
    var name: String
    var description: String
    var completed: Bool
}
