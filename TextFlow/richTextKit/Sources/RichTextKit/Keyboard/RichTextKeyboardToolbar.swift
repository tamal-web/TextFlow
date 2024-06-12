
//#if iOS || macOS || os(visionOS)
import SwiftUI
import RichTextKit

public struct RichTextKeyboardToolbar<LeadingButtons: View, TrailingButtons: View, FormatSheet: View>: View {

    public init(
        context: RichTextContext,
//        context2: RichTextFont,
        @ViewBuilder leadingButtons: @escaping (StandardLeadingButtons) -> LeadingButtons,
        @ViewBuilder trailingButtons: @escaping (StandardTrailingButtons) -> TrailingButtons,
        @ViewBuilder formatSheet: @escaping (StandardFormatSheet) -> FormatSheet
    ) {
        self._context = ObservedObject(wrappedValue: context)
        self.leadingButtons = leadingButtons
        self.trailingButtons = trailingButtons
        self.formatSheet = formatSheet
//        self.context2 = RichTextFont
    }

    public typealias StandardLeadingButtons = EmptyView
    public typealias StandardTrailingButtons = EmptyView
    public typealias StandardFormatSheet = RichTextFormat.Sheet

    private let leadingButtons: (StandardLeadingButtons) -> LeadingButtons
    private let trailingButtons: (StandardTrailingButtons) -> TrailingButtons
    private let formatSheet: (StandardFormatSheet) -> FormatSheet

    @ObservedObject
    private var context: RichTextContext
    
//    private var context2 = RichTextContext()

    @State
    private var isFormatSheetPresented = false

    @Environment(\.horizontalSizeClass)
    private var horizontalSizeClass

    @Environment(\.richTextKeyboardToolbarConfig)
    private var config

    @Environment(\.richTextKeyboardToolbarStyle)
    private var style

    public var body: some View {
        VStack(spacing: 0) {
            HStack(spacing: style.itemSpacing) {
                leadingViews
                Spacer()
                trailingViews
            }
            .padding(10)
        }
        .environment(\.sizeCategory, .medium)
        .frame(height: style.toolbarHeight)
        .overlay(Divider(), alignment: .bottom)
        .accentColor(.primary)
        .background(
            Color.primary.colorInvert()
                .overlay(Color.white.opacity(0.2))
                .shadow(color: style.shadowColor, radius: style.shadowRadius, x: 0, y: 0)
        )
//        .opacity(shouldDisplayToolbar ? 1 : 0)
        .opacity(1)
        .offset(y: 0)
        .frame(height: nil)
        .sheet(isPresented: $isFormatSheetPresented) {
            formatSheet(
                .init(context: context)
            )
            .prefersMediumSize()
        }
    }
}

private extension View {

    @ViewBuilder
    func prefersMediumSize() -> some View {
        #if macOS
        self
        #else
        if #available(iOS 16, *) {
            self.presentationDetents([.medium])
        } else {
            self
        }
        #endif
    }
}

private extension RichTextKeyboardToolbar {

    var isCompact: Bool {
        horizontalSizeClass == .compact
    }
}

private extension RichTextKeyboardToolbar {

    var divider: some View {
        Divider()
            .frame(height: 25)
    }

    @ViewBuilder
    var leadingViews: some View {
        RichTextAction.ButtonStack(
            context: context,
            actions: config.leadingActions,
            spacing: style.itemSpacing
        )

        leadingButtons(StandardLeadingButtons())

        divider

        Button(action: presentFormatSheet) {
            Image.richTextFormat
                .contentShape(Rectangle())
        }

        RichTextStyle.ToggleStack(context: context)
            .keyboardShortcutsOnly(if: isCompact)

        RichTextFont.SizePickerStack(context: context)
            .keyboardShortcutsOnly()
    }

    @ViewBuilder
    var trailingViews: some View {
        RichTextAlignment.Picker(selection: $context.textAlignment)
            .pickerStyle(.segmented)
            .frame(maxWidth: 200)
//            .keyboardShortcutsOnly(if: isCompact)

        trailingButtons(StandardTrailingButtons())

        RichTextAction.ButtonStack(
            context: context,
            actions: config.trailingActions,
            spacing: style.itemSpacing
        )
    }
}

private extension View {

    @ViewBuilder
    func keyboardShortcutsOnly(
        if condition: Bool = true
    ) -> some View {
        if condition {
//            self.hidden()
//                .frame(width: 0)
        } else {
            self
        }
    }
}



private extension RichTextKeyboardToolbar {

    func presentFormatSheet() {
        isFormatSheetPresented = true
    }
}

//#Preview {
//
//    struct Preview: View {
//
//        @State
//        private var text = NSAttributedString(string: "")
//
//        @StateObject
//        private var context = RichTextContext()
//
//        var body: some View {
//            VStack(spacing: 0) {
//                RichTextEditor(text: $text, context: context)
//                    .background(Color.white)
//                    .cornerRadius(10)
//                    .padding()
//                    .background(Color.gray.ignoresSafeArea())
//                RichTextKeyboardToolbar(
//                    context: context,
//                    leadingButtons: { _ in Color.red },
//                    trailingButtons: { _ in Color.green},
//                    formatSheet: { $0 }
//                )
//            }
//            .richTextKeyboardToolbarConfig(.init(
//                alwaysDisplayToolbar: false,
//                leadingActions: [.print],
//                trailingActions: [.print]
//            ))
//        }
//    }
//
//    return Preview()
//}
//#endif


