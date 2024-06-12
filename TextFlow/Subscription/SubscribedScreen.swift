//
//  SubscribedScreen.swift
//  TextFlow
//
//  Created by Tamal on 16/07/24.
//

import SwiftUI

struct SubscribedScreen: View, DocumentGroupModalPlugin {
    @State var SelectedId : String = "subscription.yearly"
    
    @Environment(\.colorScheme) private var colorScheme: ColorScheme
    @StateObject var storeVM = StoreVM()
    @State var isPurchased = false
    @Environment(\.dismiss)
    private var dismiss
    
    var body: some View {
//        Text("You are a Premium User!!")
//        Text("Enjoy the following Benifits")
        ZStack {
            VStack(spacing: 0){

                Button{
                      do{
                          try dismissDocumentGroupModal()
                      }catch{
                          print("Failed to dismiss modal: \(error)")
                          dismiss()
                      }
                } label:{
                    Image(systemName: "xmark.circle.fill").foregroundStyle(colorScheme == .dark ? .black : .white ,colorScheme == .dark ? Color(hex: "272727") : Color(hex:"CECECE")).font(.system(size: 22)).padding(.leading, 21)
                }
                
            }.frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/, maxHeight: .infinity,alignment: .init(horizontal: .leading, vertical: .top)).padding(.top, 21)
            VStack{
                Image("icon").resizable().frame(width: 80, height: 80).background(.gray).clipShape(RoundedRectangle(cornerRadius: /*@START_MENU_TOKEN@*/25.0/*@END_MENU_TOKEN@*/)).padding(.bottom, 0).padding(.top, 12)
                
                Text("TextFlow Premium").font(.system(size: 25)).fontWeight(.bold).padding(.bottom, 0)

                VStack(alignment: .leading){
                    Text("What's Incuded").frame(maxWidth: .infinity, alignment: .leading).font(.system(size: 20)).bold().padding(.leading, 12)
                    VStack{
                        FeaturesRowUIComp(Title: "Dark Mode", Desc: "Comfortable writing Experience", image: "moon")
                        FeaturesRowUIComp(Title: "Make notes faster", Desc: "Make notes directly from control center", image:"hare")
                        FeaturesRowUIComp(Title: "Reading Mode", Desc: "Stay safe from accidental changes", image: "eye")
                        FeaturesRowUIComp(Title: "More Text Customization", Desc: "More text customization features", image: "text.badge.star", isLast: true)
                    }.padding(.leading, 6).padding(.trailing, 6).padding(.bottom, 20)
                }
                
                .frame( alignment: .leading)
                .padding(.leading)
                .padding(.trailing)
                .padding(.top, 6)
                   
            }
        }.frame(maxHeight: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/)
    }
}

#Preview {
    SubscribedScreen()
}
    
