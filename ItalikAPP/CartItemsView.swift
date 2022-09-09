//
//  cartItemsView.swift
//  ItalikAPP
//
//  Created by Diego Castro on 08/09/22.
//

import SwiftUI

struct CartItemsView: View {
    
    @State var motorcycleModel: String
    @ObservedObject var VModel: ContentViewViewModel
    
    var body: some View {
        VStack {
            Image(motorcycleModel)
                .resizable()
                .scaledToFit()
                .navigationTitle("Modelo "+motorcycleModel)
                .padding()
            
            Spacer()
            VStack {
                
                Text(VModel.descripcionMoto)
                    .font(.headline).bold().italic()
                    .padding()
                
                Spacer()
                
                Text("Tipo de motor: "+VModel.motorInfo)
                Text("Capacidad de combustible: \(String(format: "%.1f", VModel.combustible)) Litros")
                Text("Velocidad máxima: \(String(format: "%.1f", VModel.maxVel)) Km/h")
                Text("Cilindrada: \(String(format: "%.1f", VModel.cilindrada)) Cc")
                
                HStack {
                    
                    Text("Colores disponibles:")
                        .padding()
                    
                    ForEach(0..<VModel.coloresDisponibles.count, id: \.self) { index in
                        if VModel.coloresDisponibles[index].rawValue == "Amarillo" {
                            Circle()
                                .fill(Color.yellow)
                                .frame(width: 20, height: 20)
                        } else if VModel.coloresDisponibles[index].rawValue == "Azul" {
                            Circle()
                                .fill(Color.blue)
                                .frame(width: 20, height: 20)
                        } else if VModel.coloresDisponibles[index].rawValue == "Blanco" {
                            Circle()
                                .fill(Color.white)
                                .frame(width: 20, height: 20)
                            Circle()
                                .strokeBorder(.black, lineWidth: 0.5)
                                .frame(width: 20, height: 20)
                        } else if VModel.coloresDisponibles[index].rawValue == "Gris" {
                            Circle()
                                .fill(Color.gray)
                                .frame(width: 20, height: 20)
                        } else if VModel.coloresDisponibles[index].rawValue == "Negro" {
                            Circle()
                                .fill(Color.black)
                                .frame(width: 20, height: 20)
                        } else if VModel.coloresDisponibles[index].rawValue == "Rojo" {
                            Circle()
                                .fill(Color.red)
                                .frame(width: 20, height: 20)
                        } else if VModel.coloresDisponibles[index].rawValue == "Verde" {
                            Circle()
                                .fill(Color.green)
                                .frame(width: 20, height: 20)
                        } else {
                            
                        }
                        
                    }
                    
                }
                
                Spacer()
                
                
            }
            
            
            VStack {
                
                NavigationLink {
                    BuyProductView(motorcycleModel: motorcycleModel, VModel: VModel)
                } label: {
                    ZStack {
                        RoundedRectangle(cornerRadius: 16)
                            .frame(width: UIScreen.main.bounds.width/1.3, height: 50)
                        Text ("Comprar ya")
                            .foregroundColor(.black)
                    }
                }  .tint(Color(0xF9D71C))
                
            }
            
            
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    NavigationLink {
                        CartView(VModel: VModel)
                    } label: {
                        if VModel.objectsInCart.isEmpty {
                            withAnimation {
                                Image(systemName: "cart")
                            }
                        } else {
                            withAnimation {
                                Image(systemName: "cart.fill")
                            }
                        }
                    }
                }
            }
        }
    }
}

struct CartItemsView_Previews: PreviewProvider {
    static var previews: some View {
        CartItemsView(motorcycleModel: "", VModel: ContentViewViewModel())
    }
}
