//
//  DetailsView.swift
//  ItalikAPP
//
//  Created by Diego Castro on 08/09/22.
//

import SwiftUI

struct DetailsView: View {
    
    @State var motorcycleModel: String
    @StateObject var VModel: ContentViewViewModel
    
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
                
                Spacer()
                
                Text("Tipo de motor: "+VModel.motorInfo)
                Text("Capacidad de combustible: \(String(format: "%.1f", VModel.combustible)) Litros")
                Text("Velocidad máxima: \(String(format: "%.1f", VModel.maxVel)) Km/h")
                Text("Cilindrada: \(String(format: "%.1f", VModel.cilindrada)) Cc")
                
                HStack {
                    
                    ForEach(0..<VModel.coloresDisponibles.count, id: \.self) { index in
                        Text(VModel.coloresDisponibles[index].rawValue)
                    }
                    
                }
                
                Spacer()
                
                
            }
            
            
            VStack {
                
                Button {
                    
                } label: {
                    ZStack {
                        RoundedRectangle(cornerRadius: 16)
                            .frame(width: UIScreen.main.bounds.width/1.3, height: 50)
                        Text ("Comprar ya")
                            .foregroundColor(.black)
                    }
                }  .tint(Color(0xF9D71C))
                
                
                Button {
                    
                } label: {
                    ZStack {
                        RoundedRectangle(cornerRadius: 16)
                            .frame(width: UIScreen.main.bounds.width/1.3, height: 50)
                        Text ("Añadir al carrito")
                            .foregroundColor(.black)
                    }
                }     .tint(Color(0xF9D71C))
                
                
                
            }
            
            
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button {
                        
                    } label: {
                        Image(systemName: "cart")
                    }
                }
            }
        }
        .onAppear{
            VModel.getMoreInfo(motorcycleModel: motorcycleModel)
        }
    }
}

struct DetailsView_Previews: PreviewProvider {
    static var previews: some View {
        DetailsView(motorcycleModel: "", VModel: ContentViewViewModel())
    }
}
