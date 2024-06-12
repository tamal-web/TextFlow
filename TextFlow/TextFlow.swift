//
//  TextFlowApp.swift
//  TextFlow
//
//  Created by Tamal on 05/06/24.
//

import SwiftUI
import UniformTypeIdentifiers
import DocumentKit

@main
struct TextFlow: App {
    @StateObject var storeVM = StoreVM()
    @AppStorage("subscribed") private var subscribed :Bool = false
    var body: some Scene {


        DocumentGroup(newDocument: RtfFile()) { file in
           
           
                    RTFEdtior(document:file.$document, fileURL: file.fileURL).preferredColorScheme(.light)
//                .preferredColorScheme(.dark).environment(\.colorScheme, .dark)
        }
        .splashScreenPlugin(if: UserDefaults.standard.sub, delay: 0.5){
            
            SubscriptionTextFlowUI()
        }
        .additionalNavigationBarButtonItems(leading: [.darkTheme, .proBadge])
        
                .onboardingModalPlugin(id: "WelcomeScreen", type: .fullScreenCoverPlugin, delay:0) {
                    WelcomeScreen()
                }
//                .splashScreen(if: UserDefaults.standard.sub){
//                    SubscriptionOrignal()
//                }
              
        

        
        DocumentGroup(newDocument: TxtFile()){
            file in TxtEditViewer(document: file.$document, fileURL: file.fileURL).preferredColorScheme(.light)
//                .preferredColorScheme(.dark).environment(\.colorScheme, .dark)
        }
                }
    }
 
@MainActor

private extension DocumentGroupToolbarItem {

    static let darkTheme = DocumentGroupToolbarItem(icon: .starIcon?){
        try? WelcomeScreen().preferredColorScheme(.light)
            .presentAsDocumentGroupModal(.fullScreenCoverPlugin)
    }
    
    
    static let proBadge = DocumentGroupToolbarItem(icon: .settingss?) {
        
       
            try? SubscriptionTextFlowUI().preferredColorScheme(.light)
                   .presentAsDocumentGroupModal(.fullScreenCoverPlugin)
     
    
    }

}

private extension UIImage {
    static let popover = UIImage(systemName: "book")
    static let onboarding = UIImage(systemName: "lightbulb")
    static let settingss = UIImage(systemName: "moon.circle")
    static let starIcon = UIImage(systemName: "star.circle.fill")
    static let moonIcon = UIImage(named: "gearshape")
    
}



struct ProBadgeView: View {
    @StateObject var storeVM = StoreVM()
    
    var body: some View {
        Group {
            if storeVM.subscriptions.isEmpty {
                SubscriptionTextFlowUI()
//                    .preferredColorScheme(.light)
//                    .presentAsDocumentGroupModal(.fullScreenCoverPlugin)
            } else {
                SubscribedScreen()
//                    .preferredColorScheme(.light)
//                    .presentAsDocumentGroupModal(.fullScreenCoverPlugin)
            }
        }
    }
}

