//
//  TxtEditor.swift
//  TextFlow
//
//  Created by Tamal on 12/07/24.
//

import SwiftUI
import CodeEditorView
import LanguageSupport
import UniformTypeIdentifiers

struct TxtEditViewer:View {
    
    @Binding var document: TxtFile
     var fileURL: URL?
    
    @State private var position: CodeEditor.Position       = CodeEditor.Position()
    @State private var messages: Set<TextLocated<Message>> = Set()
    @Environment(\.colorScheme) private var colorScheme: ColorScheme
    var body: some View {
        VStack{
            
        }.toolbar(){
            ToolbarItem(placement: .topBarTrailing){
                ShareLink(item: fileURL!) {
                    Image(systemName: "square.and.arrow.up").resizable().aspectRatio(contentMode: .fit).frame(width: 17).padding(.leading ,6).padding(.trailing, 0)
                       }
            }
        }
                    CodeEditor(text: $document.text, position: $position, messages: $messages, layout: CodeEditor.LayoutConfiguration(showMinimap: true, wrapText: true)).ignoresSafeArea(edges: .bottom)
                                    .environment(\.codeEditorTheme,
                                                  colorScheme == .dark ? Theme.dark : Theme.light)
    }
}


