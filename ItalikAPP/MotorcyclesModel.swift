//
//  MotorcyclesModel.swift
//  ItalikAPP
//
//  Created by Diego Castro on 07/09/22.
//

import Foundation

// MARK: - Welcome
struct MotorcyclesModel: Codable {
    let modelos: [String: [Modelo]]

    enum CodingKeys: String, CodingKey {
        case modelos = "Modelos"
    }
}

// MARK: - Modelo
struct Modelo: Codable {
    let modelo: String
    let coloresDisponibles: [ColoresDisponible]
    let tipoDeMotor: String
    let cilindrada: Double
    let velocidadMaxima: Int
    let capacidadDeCombustible: Double
}

enum ColoresDisponible: String, Codable {
    case amarillo = "Amarillo"
    case azul = "Azul"
    case blanco = "Blanco"
    case gris = "Gris"
    case negro = "Negro"
    case rojo = "Rojo"
    case verde = "Verde"
}
