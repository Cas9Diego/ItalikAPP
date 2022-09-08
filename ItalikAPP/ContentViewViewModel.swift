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
    @Published var motorcycleModelsArray = [Modelo]()
    @Published var coloresDisponibles: [ColoresDisponible] = []
    @Published var motorInfo: String = ""
    @Published var cilindrada: Double = 0
    @Published var maxVel: Double = 0
    @Published var combustible: Double = 0
    
    
    @Published var userInput: String = ""
    @Published var showingTableOfResults: Bool = false
    @Published var searchResults: [String] = []
    @Published var descripcionMoto: String = ""
    @Published var cartState: Bool = false
    
    
    @Published var nombre: String = ""
    @Published var apellidoPat: String = ""
    @Published var apellidoMat: String = ""
    @Published var calle: String = ""
    @Published var numeroExteInt: String = ""
    @Published var ciudad: String = ""
    @Published var numeroDeTarjeta: String = ""
    @Published var fechaDeExpiracion: String = ""
    @Published var condigoDeSeguridad: String = ""
    
    
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
            if let currentModel = motorcyclesList[model] {
            for i in 0..<currentModel.count {
                DispatchQueue.main.async {
                    self.motorcycleModelCodes.append(currentModel[i].modelo)
                }
                self.motorcycleModelsArray.append(currentModel[i])
            }
        }
        }
    }
    
    func getMoreInfo (motorcycleModel: String) {
        let filteredResult = motorcycleModelsArray.filter{
            $0.modelo == motorcycleModel
        }
        if filteredResult.isEmpty == false {
            coloresDisponibles = filteredResult[0].coloresDisponibles
            motorInfo = filteredResult[0].tipoDeMotor
            cilindrada = filteredResult[0].cilindrada
            maxVel = Double(filteredResult[0].velocidadMaxima)
            combustible = filteredResult[0].capacidadDeCombustible
            descripcionMoto = filteredResult[0].descripcion
        } else {
            motorInfo = "Hubo un error al cargar sus datos"
        }
        
    }
    
    func userSearch () {
        
        if modelsArray.contains(userInput) || modelsArray.contains(userInput.uppercased()) {
            
            if let currentCategory = motorcyclesList[userInput] {
            
            for i in 0..<currentCategory.count {
                
                searchResults.append(currentCategory[i].modelo)
            }
                
            } else { return }
            
            
        } //AQUI VIENE MAS
        else if motorcycleModelCodes.contains(userInput) {
            
            searchResults.append(userInput)
            
        } else {
            
            for i in 0..<motorcycleModelsArray.count {
                

                
            }
            
        }
        
    }
    
}
