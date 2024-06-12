//
//  dismissModal.swift
//  TextFlow
//
//  Created by Tamal on 02/07/24.
//

/// This is an added feature to the package DocumentKit
/// This adds the feautre to dismiss swiftUI independently and directly jump into DocumentGroup screen if there were more screen opened before the particular screen.
/// Edited by Tamal

import Foundation


import SwiftUI
import DocumentKit

/// This protocol can be implemented by any view, to make it
/// possible to open it from a document group.
public protocol DocumentGroupModalPlugin: View, DocumentGroupInspector, Sendable {

    /// Present the view as a document group modal.
    ///
    /// Popup modals are handled specially due to IOS bug:
    /// https://github.com/expo/expo/issues/22192.
    func presentAsDocumentGroupModal(
        _ type: DocumentGroupModalType
    ) throws
    
    /// Dismiss the presented view.
    func dismissDocumentGroupModal() throws
}

/// This enum defines the supported document group modals.
public enum DocumentGroupModalType: Sendable {

    case sheetPlugin, fullScreenCoverPlugin, popover, custom(_ style: UIModalPresentationStyle)
}

public extension DocumentGroupModalType {

    /// The native presentation style to use.
    var presentationStyle: UIModalPresentationStyle {
        switch self {
        case .sheetPlugin: .automatic
        case .fullScreenCoverPlugin: .fullScreen
        case .popover: .popover
        case .custom(let style): style
        }
    }
}

/// This internal inspector is used by the view extensions.
private final class InternalInspector: DocumentGroupInspector, Sendable {

    static let shared = InternalInspector()
    
    weak var presentedViewController: UIViewController?

    var rootViewController: UIViewController? {
            guard let window = UIApplication.shared.connectedScenes
                    .compactMap({ $0 as? UIWindowScene })
                    .flatMap({ $0.windows })
                    .first(where: { $0.isKeyWindow }) else { return nil }
            return window.rootViewController
        }
        
        var documentBrowser: UIDocumentBrowserViewController? {
            return rootViewController as? UIDocumentBrowserViewController
        }
}

@MainActor
public extension View {

    /// Present the view as a document group modal.
    ///
    /// Popup modals are handled with some iOS 16 hacks, due
    /// to a bug: https://github.com/expo/expo/issues/22192.
    func presentAsDocumentGroupModal(
        _ type: DocumentGroupModalType
    ) throws {
        let inspector = InternalInspector.shared
        guard let parent = inspector.rootViewController else { throw DocumentGroupError.noParentWindow }
        let controller = UIHostingController(rootView: self)
        inspector.presentedViewController = controller
        controller.modalPresentationStyle = type.presentationStyle
        controller.isModalInPresentation = false
        let rootView = controller.view
        if inspector.documentBrowser == nil { return }

//        // Handle popover positioning
        if let popover: UIPopoverPresentationController = controller.popoverPresentationController {
            if #available(iOS 16.0, *) {
                popover.sourceItem = UIBarButtonItem.selectedItem
            } else {
                /// Before iOS 16, the best we can do, is to
                /// show popover at the root view origin.
                popover.sourceView = rootView
                popover.sourceRect = rootView?.bounds ?? CGRect()
            }
        }

        parent.show(controller, sender: nil)
    }

    /// Dismiss the presented view.
    func dismissDocumentGroupModal() throws {
        let inspector = InternalInspector.shared
        guard let presentedViewController = inspector.presentedViewController else { throw DocumentGroupError.noParentWindow }
        presentedViewController.dismiss(animated: true) {
            inspector.presentedViewController = nil
        }
    }
}

extension UIBarButtonItem {
    static var selected = false
    static var selectedItem: UIBarButtonItem?
}
