//
//  CartView.swift
//  ItalikAPP
//
//  Created by Diego Castro on 08/09/22.
//

import SwiftUI

struct CartView: View {
    @StateObject var VModel: ContentViewViewModel
    var body: some View {
        if VModel.objectsInCart.isEmpty == false {
        List {
            ForEach(VModel.objectsInCart, id: \.self) { model in

            NavigationLink {
                DetailsView(motorcycleModel: model, VModel: VModel)
            } label: {
                Text("Motocicleta modelo "+model)
            }
            }
            .onDelete(perform: delete)
        }.listStyle(.plain)
        } else {
            
            VStack {
                Text("Tu carrito está vacio 😒")
                    .font(.system(size: 40))
                    .multilineTextAlignment(.center)
                    .padding()
            }
            
        }
    }
    
    func delete(at offsets: IndexSet) {
        VModel.objectsInCart.remove(atOffsets: offsets)
        VModel.saveChanges()
    }
}

struct CartView_Previews: PreviewProvider {
    static var previews: some View {
        CartView(VModel: ContentViewViewModel())
    }
}
