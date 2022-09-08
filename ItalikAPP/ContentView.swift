//
//  ContentView.swift
//  ItalikAPP
//
//  Created by Diego Castro on 07/09/22.
//

import SwiftUI

struct ContentView: View {
    @StateObject private var VModel = ContentViewViewModel()
    
    let columns = Array(
        repeating: GridItem(spacing: 0),
        count: 2
    )
    
    var body: some View {
        NavigationView {
            ZStack {
                VStack {
                    
                    ZStack(alignment: .topLeading) {
                        RoundedRectangle(cornerRadius: 20, style: .continuous)
                            .foregroundColor(Color(uiColor: .white))
                            .frame(height: 50)
                            .padding(.horizontal)
                            .shadow(color: .gray, radius: 2, x: 0, y: 0)
                        
                        TextField("Busca un modelo o categoria", text: $VModel.userInput)
                            .onChange(of: VModel.userInput) { _ in
                                VModel.userSearch()
                            }
                            .padding()
                            .padding(.leading, 16)
                            .disableAutocorrection(true)
                        
                        
                        if VModel.userInput.isEmpty == false {
                            
                            ZStack {
                                Button {
                                    VModel.userInput = ""
                                    VModel.searchResults = []
                                } label: {
                                    Image(systemName: "x.circle.fill")
                                        .foregroundColor(.secondary)
                                }
                            }
                            .offset(x: UIScreen.main.bounds.width*0.85)
                            .padding(.top, 16)
                            
                        }
                        
                        
                        
                    }
                    
                    
                    ScrollView  {
                        LazyVGrid(columns: columns, spacing: 0) {
                            ForEach(0..<VModel.motorcycleModelCodes.count, id: \.self) { index in
                                VStack {
                                    NavigationLink {
                                        DetailsView(motorcycleModel: VModel.motorcycleModelCodes[index], VModel: VModel)
                                    }label: {
                                        Image(VModel.motorcycleModelCodes[index])
                                            .resizable()
                                            .scaledToFit()
                                            .background(Color(UIColor.systemGray5))
                                            .cornerRadius(16)
                                    }
                                    Text("Modelo "+VModel.motorcycleModelCodes[index])
                                }
                                .padding()
                                
                            }
                            
                        }
                        
                    }.onAppear{
                        self.VModel.getDataFromCatalog()
                    }
                    .navigationTitle("Todos los modelos")
                }
                if VModel.searchResults.isEmpty == false {
                    
                    ZStack {
                        
                        List (VModel.searchResults, id: \.self) { result in
                            
                            NavigationLink {
                                DetailsView(motorcycleModel: result, VModel: VModel)
                            } label: {
                                Text ("Modelo " + result)
                            }
                        }
                        .listStyle(.automatic)
                        .padding(.top, 52)
                        
                        
                    }
                    
                }
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

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
