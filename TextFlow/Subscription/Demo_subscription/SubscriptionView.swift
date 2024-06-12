//
//  SubscriptionView.swift
//  TextFlow
//
//  Created by Tamal on 17/06/24.
//

import SwiftUI
import StoreKit

struct SubscriptionView: View {
    @EnvironmentObject var storeVM : StoreVM
    @State var isPurchased = false
    var body: some View {
        Group{
            Section("Upgrade To Premium"){
                ForEach(storeVM.subscriptions){
                    product in
                    Button(action: {
                        Task{
                            await buy(product: product)
                            
                        }
                    }) {
                        VStack{
                            HStack{
                                Text(product.displayPrice)
                                Text(product.displayName)
                            }
                            Text(product.description)
                        }.padding() .foregroundStyle(.white)
                            .padding()
                            .background(Color.blue)
                            .clipShape(RoundedRectangle(cornerRadius: 15))
                    }
                }
            }
        }
    }
    func buy(product: Product)async{
        do {
            if try await storeVM.purchase(product) != nil{
                isPurchased = true
            }
        }catch{
            print("purchase failed")
        }
    }
}


//#Preview {
//    SubscriptionView()
//}

