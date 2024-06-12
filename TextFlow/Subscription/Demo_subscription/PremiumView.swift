//
//  PremiumView.swift
//  TextFlow
//
//  Created by Tamal on 17/06/24.
//

import SwiftUI

struct PremiumView: View {
    @StateObject var storeVM = StoreVM()
    var body: some View {
        VStack{
            if storeVM.purchasedSubscription.isEmpty{
                SubscriptionView()
            }else{
                Text("Premium Content")
                Image(systemName: "swift")
            }
        }.environmentObject(storeVM)
    }
}

#Preview {
    PremiumView()
}
