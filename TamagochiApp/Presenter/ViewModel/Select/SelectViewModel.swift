//
//  SelectViewModel.swift
//  TamagochiApp
//
//  Created by Carki on 2023/03/11.
//

import Foundation

final class SelectViewModel: ObservableObject {
    var dataModel = TamagochiIntroModel()
    
    @Published var tamagochiImage: [String] = []
    @Published var tamagochiName: [String] = []
    @Published var tamagochiDetail: [String] = []
    
    init() {
        insertData()
    }
    
    func insertData() {
        tamagochiImage = dataModel.introImage
        tamagochiName = dataModel.introName
        tamagochiDetail = dataModel.introDetail
    }
    
    
    
}
