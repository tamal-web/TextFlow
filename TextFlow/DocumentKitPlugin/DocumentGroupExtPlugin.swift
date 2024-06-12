//
//  DocumentGroup+Onboarding.swift
//  DocumentKit
//
//  Created by Daniel Saidi on 2023-05-26.
//  Copyright © 2023-2024 Daniel Saidi. All rights reserved.
//

import SwiftUI
import DocumentKit

@MainActor
public extension DocumentGroup {

    func onboardingModalPlugin<Contents: DocumentGroupModalPlugin>(
        id: String?,
        type: DocumentGroupModalType = .sheetPlugin,
        store: UserDefaults? = nil,
        delay: TimeInterval? = .defaultDocumentModalDelay,
        dismissAfter: TimeInterval? = nil,
        @ViewBuilder content: @escaping () -> Contents
    ) -> DocumentGroup {
        let store = store ?? .standard
        if let id {
            if store.documentPresentationState(for: id) { return self }
            store.setDocumentPresentationState(to: true, for: id)
        }

        return modal(
            type: type,
            delay: delay,
            dismissAfter: dismissAfter,
            content: content()
        )
    }

    func splashScreenPlugin<Contents: DocumentGroupModalPlugin>(
        if condition: Bool ,
        type: DocumentGroupModalType = .fullScreenCoverPlugin,
        store: UserDefaults? = nil,
        delay: TimeInterval? = .defaultDocumentModalDelay,
        dismissAfter: TimeInterval? = nil,
        @ViewBuilder content: @escaping () -> Contents
    ) -> DocumentGroup {
        guard condition else { return self }
        return modal(
            type: type,
            delay: delay,
            dismissAfter: dismissAfter,
            content: content()
        )
    }

    func modal<Contents: DocumentGroupModalPlugin>(
        type: DocumentGroupModalType,
        delay: TimeInterval? = .defaultDocumentModalDelay,
        dismissAfter: TimeInterval? = nil,
        content: Contents
    ) -> DocumentGroup {
        let defaultDelay = TimeInterval.defaultDocumentModalDelay
        let delay = max(0.1, delay ?? defaultDelay)

        DispatchQueue.main.asyncAfter(deadline: .now() + delay) {
            do {
                try content.presentAsDocumentGroupModal(type)
            } catch {
                // treat as mission critical
                fatalError("*** Onboarding screen error: \(error) ***")
            }
        }
        
        if let dismiss = dismissAfter {
            DispatchQueue.main.asyncAfter(deadline: .now() + delay + dismiss) {
                dismissCurrentDocument()
            }
        }
        return self
        
    }
}

extension DocumentGroup: @unchecked Sendable {}
