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
        List {
            ForEach(VModel.objectsInCart, id: \.self) { model in

            NavigationLink {
                DetailsView(motorcycleModel: model, VModel: VModel)
            } label: {
                Text("Motocicleta modelo "+model)
            }
            }
            .onDelete(perform: delete)
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
