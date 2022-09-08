//
//  ContentViewViewModel.swift
//  ItalikAPP
//
//  Created by Diego Castro on 07/09/22.
//

import Foundation
import SwiftUI

class ContentViewViewModel: ObservableObject {
    
    @Published var motorcyclesList = [String : [Modelo]]()
    @Published var motorcycleModelCodes = [String]()
    
    let modelsArray = ["TRABAJO", "MOTONETA", "LINEA_Z", "DEPORTIVA", "DOBLE_PROPOSITO", "CUATRIMOTO", "CHOPPER", "ADVENTURE", "VORT_X", "CAFE_RACER", "ELECTRICA", "CROSSOVER", "TRIMOTO"]
    
    
    func getDataFromCatalog () {
        if let filePath = Bundle.main.path(forResource: "Catalogo", ofType: "json") {
            let fileUrl = URL(fileURLWithPath: filePath)
            let data = try? Data(contentsOf: fileUrl)
            if let data = data {
                parse(json: data)
                generateModelCodes()
            }
            
        }
        
    }
    
    func parse (json: Data) {
        let decoder = JSONDecoder()
        if let jsonMotorcycleList = try? decoder.decode(MotorcyclesModel.self, from: json) {
            motorcyclesList = jsonMotorcycleList.modelos
        }
        
    }
    
    func generateModelCodes () {
        for model in modelsArray {
            let currentModel = motorcyclesList[model]!
            for i in 0..<currentModel.count {
                DispatchQueue.main.async {
                    self.motorcycleModelCodes.append(currentModel[i].modelo)
                }
            }
        }
    }
}
