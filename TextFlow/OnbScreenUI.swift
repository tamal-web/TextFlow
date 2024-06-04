//
//  OnbScreenUI.swift
//  Editor Master
//
//  Created by Tamal on 11/06/24.
//

import SwiftUI


extension Color {
    init(hex: String) {
        var cleanHexCode = hex.trimmingCharacters(in: .whitespacesAndNewlines)
        cleanHexCode = cleanHexCode.replacingOccurrences(of: "#", with: "")
//        print(cleanHexCode)
        var rgb: UInt64 = 0
        
        Scanner(string: cleanHexCode).scanHexInt64(&rgb)
        
        let redValue = Double((rgb >> 16) & 0xFF) / 255.0
        let greenValue = Double((rgb >> 8) & 0xFF) / 255.0
        let blueValue = Double(rgb & 0xFF) / 255.0
        self.init(red: redValue, green: greenValue, blue: blueValue)
    }
}

struct OnbScreenUI: View {
    
//    @State private var index = 0
    @AppStorage("index") var index = 0
    var colour1 = Color(hex: "#7D00E0")
    var body: some View {
        
        VStack {
            Text("TextFlow")
                .font(.caption)
                .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                .foregroundStyle(.white)
                .padding(.vertical, 8)
                .padding(.horizontal)
                .background(index == 0 ? colour1 : index == 1 ? .blue : .red)
                .clipShape(RoundedRectangle(cornerRadius: 8))
            TabView(selection: $index){
                ForEach(0..<3){ i in
                    Image("ss\(i)")
                        .resizable()
                        .padding()
                        .aspectRatio( contentMode: .fit)
                }
                
            }.tabViewStyle(.page(indexDisplayMode: .never))
            .tabViewStyle(PageTabViewStyle())
                
           
            HStack(spacing:4){
                ForEach(0 ..< 3){
                    i in
                    Color(colour1).opacity(i == index ? 1 : 0.5)
                        .frame(width:i == index ? 8: 16, height: 8)
                        .animation(.easeInOut(duration: 0.4), value: i == index)
                }
            }
            

            ZStack {
                ForEach(0 ..< 3){
                    i in
                    VStack{
                        
//                        Text("hi")
                        Text(index==0 ? "A rich text Editor that solves your problem" : index == 1 ? "Oh, And we have a plain Text Editor tooo!" : "So Did I tell you about the Dark Theme?").fontDesign(.monospaced).padding(.bottom).padding(.top)
//                        Text("hi")
                    }
                   
                        .opacity(i == index ? 1 : 0)
//                        .offset(CGSize(width: 10.0, height: i == index ? 0 : 100))
//                        .animation(.easeInOut, value: i == index)
                }
              
            }
            
            Button{
                if(index == 2){
                    print("hi")
                }else{
                    index += 1
                }
                
            }label: {
                Text(index == 0 ? "GREAT" : index == 1 ? "OKAY! I get the Point!" : "Take me to TextFLow!!").font(.headline).frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/, maxHeight: 48).foregroundStyle(.white).background(index == 0 ? colour1 : index == 1 ? .blue : .red).clipShape(RoundedRectangle(cornerRadius: 12))
            }
            
          
//            Circle()
              
        }.padding()
    }
}

#Preview {
    OnbScreenUI()
}

