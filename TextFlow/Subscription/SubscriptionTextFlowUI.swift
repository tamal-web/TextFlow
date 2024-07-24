//
//  SubscriptionTextFlowUI.swift
//  TextFlow
//
//  Created by Tamal on 02/07/24.
//

import SwiftUI
struct SubscriptionTextFlowUI: View, DocumentGroupModalPlugin {
//    @StateObject var storeVM = StoreVM()

    var forcedColor : ColorScheme = .light
    @State var SelectedId : String = "subscription.yearly"
    @Environment(\.colorScheme) private var colorScheme: ColorScheme 
    @StateObject var storeVM = StoreVM()
    @State var isPurchased = false
    @Environment(\.dismiss)
    private var dismiss
    @State private var isChecked = true
    @Environment(\.openWindow) private var openWindow
    @Environment(\.presentationMode) var presentationMode
    @State private var shouldRerender = false
    var showLogoOnChoseYourPlan = false
    
    var body: some View {
        if(storeVM.purchasedSubscription.isEmpty) {
            
            NavigationStack {

                VStack {
                    Spacer()

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
                        
                    }.frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/,alignment: .init(horizontal: .leading, vertical: .top)).padding(.top, 21)
                    
//                    VStack{
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
                                    }.frame( alignment: .leading)
                                    .padding(.leading)
                                    .padding(.trailing)
                                    .padding(.top, 6)
                                
                                    VStack(spacing: 0){
                                        Text("Choose Your Plan").font(.system(size: 19)).bold().padding(.leading, 8).frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/, alignment: .leading).padding(.bottom, 8)
                                        VStack(spacing: 0){

                                            
                                            
                                            VStack(spacing:0){
                                                RadioButtonGroups(SelectedId:$SelectedId ,action: handleTap)
                                                .environmentObject(storeVM)
                                            }
                                        }.frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/, alignment: .leading).padding(16)
                                            .background(colorScheme == .dark ? Color(hex:"#1C1C1E") : Color(hex: "FFFFFF"))
                                            .clipShape(RoundedRectangle(cornerRadius: 16))
                                            .shadow(color: Color(hex: "2E2E2E").opacity(0.2), radius: 130, x: 0, y: 2)
                                        
                                    }.frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/, alignment: .leading)
                                    .padding(.horizontal)
                            
//                     }
                    
//                    .padding(.top, 0)
//                    Spacer()
                    
                    Spacer()
                    VStack{
                        BuyView(SelectedID: $SelectedId ,shouldRerender: $shouldRerender).environmentObject(storeVM)
                    }
//                    .frame(maxHeight: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/ ,alignment: .bottom)
//                    .frame(alignment: .bottom)
                        .padding(.top, 10)
                        .background(colorScheme == .dark ? Color(hex:"#1C1C1E") :  .white)
                        
                    
                }  .onAppear{
//                    print(UserDefaults.standard.firstVisit)
                    UserDefaults.standard.firstVisit = false
//                    print(UserDefaults.standard.firstVisit)
                    }
            }.navigationBarBackButtonHidden()
//                .preferredColorScheme(.light)
              
        }else{
            SubscribedScreen()
        }
    }
    func handleTap(id:String){
        SelectedId = id
        shouldRerender.toggle()
    }
    
    func radioGroupCallback(id: String) {
        handleTap(id: id)
    }
    
}


#Preview {
    SubscriptionTextFlowUI()
}


