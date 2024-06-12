//
//  CustEnvKey.swift
//  TextFlow
//
//  Created by Tamal on 02/07/24.
//

import Foundation
import SwiftUI

struct DismissSheetKey: EnvironmentKey {
    static let defaultValue: (() -> Void) = {}
}

extension EnvironmentValues {
    var dismissSheet: (() -> Void) {
        get { self[DismissSheetKey.self] }
        set { self[DismissSheetKey.self] = newValue }
    }
}

extension View {
    func dismissSheet(_ action: @escaping () -> Void) -> some View {
        environment(\.dismissSheet, action)
    }
}
