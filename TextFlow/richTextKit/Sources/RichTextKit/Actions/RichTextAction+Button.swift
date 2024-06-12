import SwiftUI
import RichTextKit

public extension RichTextAction {

    /**
     This button can be used to trigger a ``RichTextAction``.

     This renders a plain `Button`, which means that you can
     use and configure it as a normal button.
     */
    struct Button: View {
      
        public init(
            action: RichTextAction,
            context: RichTextContext,
            fillVertically: Bool = false,
            additionalAction: @escaping ()->Void
        ) {
            self.action = action
            self._context = ObservedObject(wrappedValue: context)
            self.fillVertically = fillVertically
            self.additionalAction = additionalAction
        }

        private let action: RichTextAction
        private let fillVertically: Bool
        private let additionalAction: () -> Void

        @ObservedObject
        private var context: RichTextContext

        public var body: some View {
            SwiftUI.Button(action: triggerAction) {
                action.label
                    .labelStyle(.iconOnly)
                    .frame(maxHeight: fillVertically ? .infinity : nil)
                    .contentShape(Rectangle())
            }
            .keyboardShortcut(for: action)
            .disabled(!context.canHandle(action))
        }
    }
}

private extension RichTextAction.Button {

    func triggerAction() {
        context.handle(action)
        additionalAction()
    }
}

