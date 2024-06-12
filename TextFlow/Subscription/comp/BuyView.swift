//
//  BuyView.swift
//  TextFlow
//
//  Created by Tamal on 02/07/24.
//

import SwiftUI
import StoreKit

struct BuyView: View {
    @Binding var SelectedID : String
    @State var isPurchased = false
    @EnvironmentObject var storeVM : StoreVM
    @Binding var shouldRerender: Bool
    @Environment(\.colorScheme) private var colorScheme: ColorScheme
    @AppStorage("subscribed") private var subscribed = false
    
    
    var body: some View {
        
        VStack{
            ForEach(storeVM.subscriptions){
                product in
                if(product.id == SelectedID){
                    VStack(spacing: 0){
                        
                        HStack{
                            Text("\(product.displayPrice) / \(product.displayName)").frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/,minHeight: 30 ,alignment: .leading).font(.system(size: 19)).fontWeight(.semibold)
                            
                            if(SelectedID=="subscription.yearly"){
                                Text("3 Days Free ✨").bold().font(.system(size:15)).padding(.horizontal, 9).padding(.vertical, 5)
                                    .background(Color(hex: "6DD978").opacity(colorScheme == .dark ? 0.2 : 0.3))
                                    .foregroundStyle(Color(hex: "09AD19")).clipShape(RoundedRectangle(cornerRadius: 10)).padding(.trailing)
                            }
                          
                            
                        }.padding(.leading).padding(.bottom,3)
                        
                        Text("No Commitment. Cancel anytime").frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/, alignment: .leading).font(.system(size: 14)).padding(.bottom, 12).padding(.leading).opacity(0.6)
                        Button{
                            Task{
                                await buy(product: product)
                            }
                        }label:{
                            Text("Try it Free").font(.system(size: 19)).bold().frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/, minHeight: 52).background(.blue).foregroundStyle(.white)
                        }.frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/, alignment: .leading).clipShape(RoundedRectangle(cornerRadius: 12)).padding(.horizontal).padding(.bottom, 14)
                       
                        HStack(spacing: 25){
                            Button{}label: {
                                Text("Restore").bold().font(.system(size: 14))
                            }
                            Button{}label: {
                                Text("Privacy").bold().font(.system(size: 14))
                            }
                            Button{}label: {
                                Text("Terms").bold().font(.system(size: 14))
                            }
                        }
                    }.frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/, alignment: .leading).padding(.horizontal).frame(alignment: .bottom)
                        .padding(.bottom, 18)
                    
                }
            }
        }.environmentObject(storeVM)
       
       
    }
    func buy(product: Product)async{
        do {
            if try await storeVM.purchase(product) != nil{
                isPurchased = true
                subscribed = true
                UserDefaults.standard.show = false
            }
        }catch{
            print("purchase failed")
        }
    }
}

