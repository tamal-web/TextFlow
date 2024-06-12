//
//  SwiftUIView.swift
//  TextFlow
//
//  Created by Tamal on 30/06/24.
//

import SwiftUI

struct closeLeading: ViewModifier {
    

    @Environment(\.dismiss)
    private var dismiss

    func body(content: Content) -> some View {
        content.toolbar {
            ToolbarItem(placement: .topBarTrailing) {
                Button("Close", action: dismiss.callAsFunction)
            }
        }
    }
}

struct skipTrailing: ViewModifier {

    @Environment(\.dismiss)
    private var dismiss

    func body(content: Content) -> some View {
        NavigationStack{
            content.toolbar {
                ToolbarItem(placement: .topBarTrailing) {
//                    if(false){
//                        Button("Skip", action: dismiss.callAsFunction)
//                    }else{
//                        NavigationLink(destination: SubscriptionTextFlowUI()){
//    //                        Button("Skip"){}
//                            Text("Skip")
//                        }
//                    }
                   
                    
                }
            }
        }
        
      
    }
}

extension View {
    func withLeadingCloseButton() -> some View {
        self.modifier(closeLeading())
    }
    func withSkipButtonTrailing() -> some View {
        self.modifier(skipTrailing())
    }
}
