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
    var bool3 : Bool {
        var b = UserDefaults.standard.show && !UserDefaults.standard.firstVisit
        return b
    }

    var body: some Scene {

        DocumentGroup(newDocument: RtfFile()) { file in
           
                    RTFEdtior(document:file.$document, fileURL: file.fileURL).preferredColorScheme(.light)
        }

        .additionalNavigationBarButtonItems(leading: [.darkTheme, .proBadge])

                .onboardingModalPlugin(id: "WelcomeScreen", type: .fullScreenCoverPlugin, delay:0) {
                    WelcomeScreen()
                }
                .splashScreenPlugin(if: bool3, delay: 0.5){
        
                    SubscriptionTextFlowUI()
                }
                


        
        DocumentGroup(newDocument: TxtFile()){
            file in TxtEditViewer(document: file.$document, fileURL: file.fileURL).preferredColorScheme(.light)
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
            } else {
                SubscribedScreen()
            }
        }
    }
}

