//
//  BuyProductView.swift
//  ItalikAPP
//
//  Created by Diego Castro on 08/09/22.
//

import SwiftUI
import ConfettiSwiftUI

struct BuyProductView: View {
    
    @State var motorcycleModel: String
    @StateObject var VModel: ContentViewViewModel
    @State var showingAlert: Bool = false
    @State private var counter = 0
    @State private var sucessFullShop = false
    
    var body: some View {
        
        ScrollView {
            
            VStack {
                
                
                Image(motorcycleModel)
                    .resizable()
                    .scaledToFill()
                
                if sucessFullShop == false {
                    Text(VModel.descripcionMoto)
                        .font(.headline).bold().italic()
                        .padding()
                    
                    Spacer()
                    
                    Group {
                        
                        Group {
                            TextField("Nombre", text: $VModel.nombre)
                                .padding()
                            
                            HStack {
                                
                                TextField("Apellido Paterno", text: $VModel.apellidoPat)
                                    .padding()
                                
                                TextField("Apellido Materno", text: $VModel.apellidoMat)
                                    .padding()
                                
                            }
                        }
                        
                        Divider()
                        
                        Group {
                            
                            HStack {
                                
                                TextField("Calle", text: $VModel.calle)
                                    .padding()
                                
                                TextField("Numero interior y exterior", text: $VModel.numeroExteInt)
                                    .padding()
                                
                            }
                        }
                        
                        TextField("Ciudad", text: $VModel.ciudad)
                            .padding()
                        
                        Divider()
                        
                        Group {
                            
                            TextField("Numero de tarjeta", text: $VModel.numeroDeTarjeta)
                                .padding()
                            
                            TextField("Fecha de Expiraci??n", text: $VModel.fechaDeExpiracion)
                                .padding()
                            
                            HStack {
                                
                                TextField("Codigo de seguridad", text: $VModel.condigoDeSeguridad)
                                
                                Button {
                                    counter+=1
                                    showingAlert = true
                                    
                                } label: {
                                    ZStack {
                                        RoundedRectangle(cornerRadius: 16)
                                            .frame (height: 45)
                                        
                                        RoundedRectangle (cornerRadius: 16)
                                            .strokeBorder(.black, lineWidth: 1)
                                            .frame (height: 45)
                                        
                                        Text ("Hacer compra")
                                            .foregroundColor(.black)
                                    }
                                }     .tint(Color(0xF9D71C))
                                    .confettiCannon(counter: $counter)
                            }
                            
                        }
                        .padding()
                        
                    }
                    
                } else {
                    VStack {
                        Text("??Compra exitosa!")
                            .font(.system(size: 60))
                            .padding()
                    }
                    
                }
                
            }
            
            .alert("Solicitud Enviada", isPresented: $showingAlert) {
                Button("Ok", role: .cancel) { sucessFullShop = true }
                
            }
        }
    }
}



struct BuyProductView_Previews: PreviewProvider {
    static var previews: some View {
        BuyProductView(motorcycleModel: "", VModel: ContentViewViewModel())
    }
}
