//
//  RadioButtonField.swift
//  TextFlow
//
//  Created by Tamal on 02/07/24.
//

import SwiftUI

struct RadioButtonField<Content: View>: View {
    @ViewBuilder let content: Content
    let id: String
    let size: CGFloat = 20
//    let color: Color = Color.black
    let textSize: CGFloat = 14
    let isMarked:Bool
    let callback: (String)->()
    
    
    init(
        id: String,
        isMarked: Bool = false,
        callback: @escaping (String)->(),
        @ViewBuilder content: () -> Content
    ) {
        self.id = id
        self.isMarked = isMarked
        self.callback = callback
        self.content = content()
    }
    
    
    @Environment(\.colorScheme) private var colorScheme: ColorScheme
    var body: some View {
        ZStack(){
            Button(action:{
                self.callback(self.id)
            }) {
                HStack(alignment: .center, spacing: 0) {
                    Image(systemName: self.isMarked ? "largecircle.fill.circle" : "circle")
                        .renderingMode(.original)
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: self.size, height: self.size)
                        .foregroundStyle(colorScheme == .dark ? (self.isMarked ? .blue : .white) : (self.isMarked ? .blue : .black)).padding(.trailing, 10)
                    content
                }.foregroundColor(colorScheme == .dark ? .white : .black).frame(maxWidth: .infinity)
            }
            
            .padding(.horizontal, 14).padding(.top, 10).padding(.bottom, 10).background(colorScheme == .dark ? (self.isMarked ? .blue.opacity(colorScheme == .dark ? 0.1 : 0.1) :  Color(hex:"#1C1C1E")) : (self.isMarked ? .blue.opacity(0.1) :  Color(hex:"FFFFFF"))).clipShape(RoundedRectangle(cornerRadius: 18)).overlay(
                RoundedRectangle(cornerRadius: 18)
                    .stroke(self.isMarked ? Color.blue : .gray , lineWidth: 1)
            ).padding(.top, id == "subscription.yearly" ? 15 : 8)
            
            
            if(id=="subscription.yearly"){
                VStack{
                    HStack{
//                        Spacer()
                        VStack(spacing:0){
                            Text("3 Days Free ✨").bold().font(.system(size:13)).padding(.horizontal, 9).padding(.vertical, 5)
                                .background(Color(hex: "6DD978")
                                    .opacity(colorScheme == .dark ? 0.2 : 0.3)
    //                                .opacity(1)
                                )
                                .foregroundStyle(Color(hex: "09AD19"))
                                .clipShape(RoundedRectangle(cornerRadius: 10))
                                .lineLimit(1)
                        }.background(colorScheme == .dark ? .black : .white).clipShape(RoundedRectangle(cornerRadius: 10)).padding(.bottom, 32)
                    }.frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/, alignment: .trailing)
//                    Spacer()
                }
            }
        }
    }
}
