////
////  OnbScreenUI.swift
////  TextFlow
////
////  Created by Tamal on 11/06/24.
////
//
//import SwiftUI
//import DocumentKit
//
//struct OnbScreenUI: View, DocumentGroupModal {
//    @Environment(\.dismiss)
//    private var dismiss
//    @State var index = 0
//    var body: some View {
//
//        NavigationStack {
//            Spacer()
//            VStack (spacing: 0){
//                Text(index == 0 ? "Rich Text Editing and Formating": index == 1 ? "Simple Text Editor and Viewer" : "Elegant Dark Theme").font(.largeTitle).fontWeight(.heavy).multilineTextAlignment(.center)
//                
////              Spacer()
//                TabView(selection: $index){
//                    ForEach(0..<3){ i in
//                        VStack{
//                           
//                            Image("ss\(i)")
//                                .resizable()
//                                .aspectRatio( contentMode: .fit).padding(.leading).padding(.trailing)
//                            Text(index==0 ? "A rich text Editor that solves your problem" : $index.wrappedValue == 1 ? "Oh, And we have a plain Text Editor tooo!" : "So Did I tell you about the Dark Theme?").padding(.bottom, 16).padding(.top).font(.title3).bold().multilineTextAlignment(.center)
//                        }
//                    }
//                    
//                }.tabViewStyle(.page(indexDisplayMode: .never))
//                .tabViewStyle(PageTabViewStyle())
//                    
//               
//                HStack(spacing:4){
//                    ForEach(0 ..< 3){
//                        i in
//                        Color(.lightGray).opacity(i == index ? 1 : 0.5)
//                            .frame(width:i == index ? 8: 16, height: 8)
//                            .animation(.easeInOut(duration: 0.4), value: i == index)
//                    }
//                }.withSkipButtonTrailing().padding(.bottom, 15)
//           
//                Button{
//                }label: {
//                    Text("Next").padding().font(.headline).frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/, maxHeight: 54).foregroundStyle(.white).background(index == 0 ? Color(hex: "#7D00E0") : index == 1 ? .blue : .red).clipShape(RoundedRectangle(cornerRadius: 12))
//                }
//
//            }.padding(.leading, 32).padding(.trailing, 32)
//        }
//    }
//}
//
//#Preview {
//    OnbScreenUI()
//}
//
//
////    var colour1 = Color(hex: "#7D00E0")
//
//
////                Text("TextFlow")
////                    .font(.caption)
////                    .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
////                    .foregroundStyle(.white)
////                    .padding(.vertical, 8)
////                    .padding(.horizontal)
////                    .background(index == 0 ? Color(hex: "#7D00E0") : $index.wrappedValue == 1 ? .blue : .red)
////                    .clipShape(RoundedRectangle(cornerRadius: 8))
//
////   index == 0 ? "GREAT" : $index.wrappedValue == 1 ? "OKAY! I get the Point!" : "Take me to TextFLow!!"
