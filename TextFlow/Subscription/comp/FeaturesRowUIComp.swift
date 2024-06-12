//
//  FeaturesRowUIComp.swift
//  TextFlow
//
//  Created by Tamal on 02/07/24.
//

import SwiftUI

struct FeaturesRowUIComp: View {
    @Environment(\.colorScheme) private var colorScheme: ColorScheme
    var Title = "Title"
    var Desc = "loream100"
    var image = "circle.fill"
    var showDesc:Bool = true
    var isLast:Bool = false
    var body: some View {
        HStack(spacing: 13){
            VStack(spacing:0){
                Image(systemName: image)
    //                .symbolRenderingMode(.palette)
                    .foregroundStyle(.green)
                    .font(.system(size: 20))
                    .padding(6)
            }
          
//                .padding()
                .frame(width: 36, height: 36)
                .background(Color(hex: "6DD978").opacity(colorScheme == .dark ? 0.2 : 0.3)).clipShape(/*@START_MENU_TOKEN@*/Circle()/*@END_MENU_TOKEN@*/)
            VStack{
                Text(Title).font(.system(size: 17)).fontWeight(.semibold ).frame(maxWidth: .infinity, alignment: .leading)
                
                if(showDesc){
                    Text(Desc).font(.system(size: 14)).fontWeight(.medium).frame(maxWidth: .infinity, alignment: .leading).opacity(0.6)
                }
               
                
            }.frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/, alignment: .leading).padding(.leading, 0)
        }.frame(maxWidth: .infinity, alignment: .leading).padding(.bottom, isLast ? 0 : 6)
    }
}

#Preview {
    VStack{
        FeaturesRowUIComp()
        FeaturesRowUIComp()
        FeaturesRowUIComp()
    }.padding(16)
    
}
