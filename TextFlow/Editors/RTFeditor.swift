//
//  ContentView.swift
//  TextFlow
//
//  Created by Tamal on 05/06/24.
//


// Featuressss

// dark mode - donneeee
// onboardingo - doingggg
// image - doneeee
// paywall - on my wayyy


import SwiftUI
import UniformTypeIdentifiers
import RichTextKit

extension UserDefaults {
    var show: Bool{
        get {
            return (UserDefaults.standard.value(forKey: "show") as? Bool) ?? true
        }
        set{
            UserDefaults.standard.setValue(newValue, forKey: "show")
        }
    }
    var firstVisit: Bool{
        get {
            return (UserDefaults.standard.value(forKey: "firstVisit") as? Bool) ?? true
        }
        set{
            UserDefaults.standard.setValue(newValue, forKey: "firstVisit")
        }}
    
}

struct RTFEdtior: View {
    
//    var funcOf : RichTextAction
    @StateObject var storeVM = StoreVM()
    
    @State private var text = NSAttributedString(string: "Type here...")
    func button(for action: RichTextAction) -> some View {
        RichTextAction.Button(
            action: action,
            context: context,
            fillVertically: true,
            additionalAction: {}
        )
    }
    @State var showColorPicker : Bool = false
    @Environment(\.colorScheme) private var colorScheme: ColorScheme

    @State var foreColour : Color = .black
   

    @StateObject
    var context = RichTextContext()
    
    @Binding var document: RtfFile
     var fileURL: URL?
    @State var speed:CGFloat = 13.0

    @State var ShowToolbar = true

    @State var currentINdex = 0
    
    func ToggleEditing(){
        context.isEditable.toggle()
    }
    var body: some View {
        VStack {

            toptoolbar(ShowToolbar: ShowToolbar, context: context, fileURL: fileURL)

            if(context.isEditable){
                RichTextEditor(text: $document.text, context: context )
            }else{
                RichTextEditor(text: .constant(document.text), context: context )
            }
            if(ShowToolbar){
                RichTextKeyboardToolbar(
                    context: context,
                    leadingButtons: {
                        
                        _ in 
//                        button(for: .copy)
                        
                        ColorPicker(selection: $foreColour, label: {
                            RichTextAction.Button(
                                action: .setColor(.foreground, UIColor(foreColour)),
                                context: context,
                                fillVertically: false,
                                additionalAction: {
                                    showColorPicker.toggle()
                                }
                            )
                        }).onChange(of: foreColour){
                            oldValue, newValue in
                            context.handle(.setColor(.foreground, UIColor(newValue)))
//                            RichTextAction.setColor(.foreground, UIColor(newValue))
                        }.frame(maxWidth: 50)

                    },
                    trailingButtons: { $0 },
                    formatSheet: { $0 }
                )
                
           
                .focusedValue(\.richTextContext, context)
            }
       
        }.environmentObject(storeVM)
        .toolbar(){
            ToolbarItem(placement: .topBarTrailing){
                Button(action: {
                    
                    ShowToolbar.toggle()
                    ToggleEditing()
                }, label: {
                        if ShowToolbar{
                            Image(systemName: "eye.circle")
                        }
                        else{
                            Image(systemName: "eye.circle.fill")
                        }
                        
                    }).navigationBarTitleDisplayMode(.inline)
            }
        }.onAppear {
            // Update foreColour based on the current color scheme
            foreColour = colorScheme == .dark ? .white : .black
        }.onChange(of: colorScheme) {oldColorScheme, newColorScheme in
            // Handle changes in the color scheme
            foreColour = newColorScheme == .dark ? .white : .black
        }
    }
}

extension UTType {
    static let textDocument = [UTType.plainText, UTType.html ]
}


struct toptoolbar:View {
    var ShowToolbar: Bool
    var context:RichTextContext
    var fileURL:URL?
//    var action: action
    func button(for action: RichTextAction) -> some View {
        RichTextAction.Button(
            action: action,
            context: context,
            fillVertically: true,
            additionalAction: {}
        )
    }
    
    var body: some View {
        if ShowToolbar{
            HStack{

                VStack {
                    HStack {
                        button(for: .undoLatestChange)
                        button(for: .redoLatestChange)
                        button(for: .copy)
                        Spacer()
                        ForEach(RichTextStyle.allCases) {
                            button(for: .toggleStyle($0))
                        }
                    }
                }.padding(5).frame(maxWidth: 500, maxHeight: 50).background(Color.gray.opacity(0.3)).clipShape(RoundedRectangle(cornerRadius: 24)).padding(.top, 1).padding(.bottom, 1).padding(.leading, 8)
            
                
                ShareLink(item: fileURL!) {
                    Image(systemName: "square.and.arrow.up").resizable().aspectRatio(contentMode: .fit).frame(width: 17).padding(.leading ,6).padding(.trailing, 7)
                       }
            } }
        else{
        }
    }
}

//struct keyboardtoolbar:View {
//    var body: some View {
//        /*@START_MENU_TOKEN@*//*@PLACEHOLDER=Hello, world!@*/Text("Hello, world!")/*@END_MENU_TOKEN@*/
//    }
//}
