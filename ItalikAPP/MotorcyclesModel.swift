//
//  MotorcyclesModel.swift
//  ItalikAPP
//
//  Created by Diego Castro on 07/09/22.
//

import Foundation

struct MotorCyclesModel: Codable {
    
    let Models: [Model]
    
}

struct Model: Codable {
    
    let modelo: String
    let coloresDisponibles: [String]
    let tipoDeMotor: String
    let cilindrada: Int
    let velocidadMaxima: Double
    let capacidadDeCombustible: Double
    
}


