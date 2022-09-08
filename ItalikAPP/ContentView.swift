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
        repeating: GridItem(spacing: 16),
        count: 2
    )
    
    var body: some View {
        NavigationView {
            
            ScrollView  {
                LazyVGrid(columns: columns, spacing: 16) {
                    ForEach(0..<VModel.motorcycleModelCodes.count, id: \.self) { index in
                        
                        NavigationLink {
                            
                        }label: {
                            Image(VModel.motorcycleModelCodes[index])
                                .resizable()
                                .scaledToFit()
                                .background(.gray)
                                .cornerRadius(20)
                        }.padding()
                    
                    }
                    
                }
                
            }.onAppear{
                self.VModel.getDataFromCatalog()
            }
            .navigationTitle("Todos los modelos")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
