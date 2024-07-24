//
//  OnBScreen.swift
//  TextFlow
//
//  Created by Tamal on 01/07/24.
//

import SwiftUI
import DocumentKit

struct OnBScreen: View, DocumentGroupModalPlugin  {
    @StateObject var storeVM = StoreVM()
    @State var index = 0
        
    @Environment(\.dismiss)
    private var dismiss
    var body: some View {
        NavigationStack{
                        
            ZStack {
                VStack{
                    Text(index == 0 ? "Rich Text Editing\nand Formating": index == 1 ? "Simple Text Editor\nand Viewer" : "Elegant\nDark Theme").font(.largeTitle).fontWeight(.heavy).multilineTextAlignment(.center).padding(.horizontal, 35).padding(.bottom, 22)
                    
                    TabView(selection: $index){
                        ForEach(0..<3){ i in
                            VStack{
                               
                                Image("ss\(i)")
                                    .resizable()
                                    .aspectRatio( contentMode: .fit).padding(.leading, 0).padding(.trailing, 0).padding(.bottom)

                            }
                          
                            
                        }
                       
                        
                    }.tabViewStyle(.page(indexDisplayMode: .never))
                        .tabViewStyle(PageTabViewStyle()).frame(height: 410).padding(.bottom, 40)
                    HStack(spacing:4){
                        ForEach(0 ..< 3){
                            i in
                            Color(.lightGray).opacity(i == index ? 1 : 0.5)
                                .frame(width:i == index ? 8: 16, height: 8)
                                .animation(.easeInOut(duration: 0.4), value: i == index)
                        }
                    }.withSkipButtonTrailing().padding(.bottom, 16)
                    Button{
                        if(index == 2){
                            dismiss.callAsFunction()
                        }else{
                            index = index + 1
                        }
                       
                    }label: {
                        if(index == 2){
                            if(storeVM.purchasedSubscription.isEmpty){
                                NavigationLink(destination: SubscriptionTextFlowUI()){
                                    Text("Next").padding().font(.headline).frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/, maxHeight: 56).foregroundStyle(.white).background(index == 0 ? Color(hex: "#7D00E0") : index == 1 ? .blue : .red).clipShape(RoundedRectangle(cornerRadius: 12))
                                }
                            }else{
                                Button{
                                  
                                        do{
                                            try dismissDocumentGroupModal()
                                        }catch{
                                            print("Failed to dismiss modal: \(error)")
                                            dismiss()
                                        }
                                    
                                }label:{
                                    Text("Next").padding().font(.headline).frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/, maxHeight: 56).foregroundStyle(.white).background(index == 0 ? Color(hex: "#7D00E0") : index == 1 ? .blue : .red).clipShape(RoundedRectangle(cornerRadius: 12))
                                }
                            }
                           
                        }else{
                         
                            Text("Next").padding().font(.headline).frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/, maxHeight: 56).foregroundStyle(.white).background(index == 0 ? Color(hex: "#7D00E0") : index == 1 ? .blue : .red).clipShape(RoundedRectangle(cornerRadius: 12))
                        }
                       
                        
                      
                       
                    }.padding(.leading, 35).padding(.trailing, 35)
                }.frame(maxHeight: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/, alignment: .center).onAppear{
                    print("hi")
                }
            }
        }
    }
}
 
#Preview {
    OnBScreen()
}
