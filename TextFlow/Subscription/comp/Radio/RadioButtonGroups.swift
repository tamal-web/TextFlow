//
//  RadioButtonGroups.swift
//  TextFlow
//
//  Created by Tamal on 02/07/24.
//

import SwiftUI

enum Option: String {
    case Monthly = "Monthly"
    case Yearly = "Yearly"
}

struct RadioButtonGroups: View {
    @Environment(\.colorScheme) private var colorScheme: ColorScheme
    @Binding var SelectedId : String
    var action: (String) -> Void
    @EnvironmentObject var storeVM : StoreVM
    @State var isPurchased = false
    
    var body: some View {
        VStack (spacing:0){
            RadioButtonField(
                id: "subscription.yearly",
                isMarked:SelectedId == "subscription.yearly" ? true : false,
                callback: radioGroupCallback,
                content:
                    {
                        VStack{
                            Text("Yearly").frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/, alignment: .leading).font(.system(size: 17)).fontWeight(.semibold)
//                                                            Text("Billed yearly").frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/, alignment: .leading).opacity(0.6).fontWeight(.semibold).font(.system(size: 13))
                        }.frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/, alignment: .leading)
                        Text("$39.99").font(.system(size: 18)).bold()
                    }
            )
            RadioButtonField(
                id: "subscription.monthly",
                isMarked:SelectedId == "subscription.monthly" ? true : false,
                callback: radioGroupCallback,
                content:
                    {
                        VStack{
                            Text("Monthly").frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/, alignment: .leading).font(.system(size: 17)).fontWeight(.semibold)
//                                                            Text("Billed Monthly").frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/, alignment: .leading).opacity(0.6).fontWeight(.semibold).font(.system(size: 13))
                        }.frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/, alignment: .leading)
                        Text("$3.99").font(.system(size: 18)).bold()
                    }
            )
            
        }.environmentObject(storeVM)
    }
    func radioGroupCallback(id: String) {
        action(id)
    }
}



//            ForEach(storeVM.subscriptions){
//                product in
//                RadioButtonField(
//                    id: product.id,
//                    isMarked:SelectedId == product.id ? true : false,
//                    callback: radioGroupCallback,
//                    content:
//                        {
//                            VStack{
//                                Text(product.displayName).frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/, alignment: .leading).font(.system(size: 18)).fontWeight(.semibold)
//                                Text(product.description).frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/, alignment: .leading).opacity(0.6).fontWeight(.semibold).font(.system(size: 14))
//                            }.frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/, alignment: .leading)
//
//
//
//
//
//                            Text(product.displayPrice).font(.system(size: 20)).bold()
//                        }
//                )
//            }
