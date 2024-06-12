//
//  WelcomeScreen.swift
//  TextFlow
//
//  Created by Tamal on 01/07/24.
//

import SwiftUI
import DocumentKit

struct WelcomeScreen: View, DocumentGroupModalPlugin  {
    var body: some View {
        NavigationStack{
            Spacer()
            VStack(alignment: .leading) {
                Image("icon").resizable().frame(width: 80, height: 80).background(.gray).clipShape(RoundedRectangle(cornerRadius: /*@START_MENU_TOKEN@*/25.0/*@END_MENU_TOKEN@*/)).padding(.bottom, 20)
                
                Text("Welcome To").font(.system(size: 45)).fontWeight(.black)
                Text("TextFlow").font(.system(size: 45)).fontWeight(.black).foregroundStyle(.blue)
                Text("Your new Note taking app         ").frame(maxWidth: .infinity, alignment: .leading).font(.headline)
            }.frame(maxWidth: .infinity).padding(.leading, 32)
          
            
            Spacer()
            VStack {
               
                HStack (spacing: 5){
                    Text("Having Trouble? Get")
                    Button("Help"){}
                }.padding(.bottom, 25).opacity(0.7)
               
                Button{
                   
                } label:{
                    NavigationLink(destination: OnBScreen().preferredColorScheme(.light)){
                        Text("Get Started").font(.headline).frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/, maxHeight: 48).foregroundStyle(.white).background(.blue).clipShape(RoundedRectangle(cornerRadius: 12))
                    }
                   
                }.padding(.leading, 32).padding(.trailing, 32).padding(.bottom, 8)
                Button{
                    
                }label:{
                    Text("Restore").bold().font(.headline)
                }
            }.padding(.bottom)
           
            
        }.preferredColorScheme(.light)
        
  
      
        
    }
}

#Preview {
    WelcomeScreen()
}
