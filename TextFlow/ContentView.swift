//
//  ContentView.swift
//  Editor Master
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
import CodeEditorView
import LanguageSupport
import RichTextKit



struct ContentView: View {
    
    @State private var text = NSAttributedString(string: "Type here...")
    func button(for action: RichTextAction) -> some View {
        RichTextAction.Button(
            action: action,
            context: context,
            fillVertically: true
        )
    }

    @StateObject
    var context = RichTextContext()
    
    @Binding var document: TextFile
     var fileURL: URL?
    @State var speed:CGFloat = 13.0
    @State private var strings = AttributedString("Hello World!")
    @State private var position: CodeEditor.Position       = CodeEditor.Position()
    @State private var messages: Set<TextLocated<Message>> = Set()
    @State var Showsize = false
    @State var ShowToolbar = true
    @State var Showmap = true
    @State var searchText:String = ""
    @State var ShowSearch = false
    @State var WordWrap = false
    @State var ShowShare = false
    @State private var isShowingFindNavigator = true
    @State var currentINdex = 0
    
    
    @Environment(\.colorScheme) private var colorScheme: ColorScheme

    var body: some View {
        
        VStack {
            if ShowToolbar{
                
                VStack {
                    HStack {
                        //                    button(for: .print)
                        button(for: .undoLatestChange)
                        button(for: .redoLatestChange)
                        button(for: .copy)
                        
                        //                    button(for: .pasteText(RichTextInsertion(content: "hii", index: , moveCursor: false)))
                        Spacer()
                        ForEach(RichTextStyle.allCases) {
                            button(for: .toggleStyle($0))
                        }
                    }
                    HStack {
                        
                       
                    }
                    
                    
                    
                    
                    //               Button(action: {
                    //                   ShowSearch.toggle()
                    //
                    //               }, label: {
                    //                   Image(systemName: "magnifyingglass.circle.fill").font(.title2)
                    //               })
                    //
                    //                Spacer().frame(width: 15)
                    //
                    //                Menu(content: {
                    //                    Button(action: {
                    //                        Theme.fontSize = 10
                    //                        Showsize.toggle()
                    //
                    //                    }, label: {
                    //                        Text("10")
                    //                    })
                    //                    Button(action: {
                    //                        changeFont13()
                    //                        Showsize.toggle()
                    //                    }, label: {
                    //                        Text("13")
                    //                    })
                    //                    Button(action: {
                    //                        changeFont16()
                    //                        Showsize.toggle()
                    //                    }, label: {
                    //                        Text("16")
                    //                    })
                    //                    Button(action: {
                    //                        changeFont19()
                    //                        Showsize.toggle()
                    //
                    //                    }, label: {
                    //                        Text("19")
                    //                    })
                    //                    Button(action: {
                    //                        changeFont22()
                    //                        Showsize.toggle()
                    //                    }, label: {
                    //                        Text("22")
                    //                    })
                    //                    Button(action: {
                    //                        Theme.fontSize = 25
                    //                        Showsize.toggle()
                    //                    }, label: {
                    //                        Text("25")
                    //
                    //                    })
                    //
                    //                }, label: {
                    //                    Image(systemName: "textformat.size").font(.title2)
                    //                })
                    //                Spacer().frame(width: 15)
                    //
                    
                    //                Button(action: {Showmap.toggle()}, label: {
                    //                    if Showmap{
                    //                        Image(systemName: "chevron.right.circle.fill").font(.title2)
                    //                    }else{
                    //                        Image(systemName: "chevron.left.circle.fill").font(.title2)
                    //                    }
                    //                })
                    //
                    //                Spacer().frame(width: 15)
                    //
                    //                Menu(content:{
                    //                    Button(action: {
                    //                        WordWrap.toggle()
                    //                        Showsize.toggle()
                    //                    }, label: {
                    //                        Text("WordWrap")
                    //                    })
                    //                }
                    //
                    //                        , label: {
                    //                    Image(systemName: "ellipsis.circle.fill").font(.title2)
                    //                })
                }.padding(5).frame(width: 350, height: 50).background(Color.gray.opacity(0.3)).clipShape(RoundedRectangle(cornerRadius: 24)).padding(.top, 1).padding(.bottom, 1)           }
            else{
            }
            
            //            RichTextKeyboardToolbarMenu(content: <#T##() -> View#>, label: <#T##() -> View#>)
            //            RichTextKeyboardToolbar(
            //                context: context,
            //                leadingButtons: { $0 },
            //                trailingButtons: { $0 },
            //                formatSheet: { $0 }
            //            )
            
            
            RichTextEditor(text: $document.text, context: context )
            RichTextKeyboardToolbar(
                context: context,
                leadingButtons: { $0 },
                trailingButtons: { $0 },
                formatSheet: { $0 }
            )
            
            //        {
            
            // You can customize the native text view here
            //        }
            
            .focusedValue(\.richTextContext, context)
            
            
            //            CodeEditor(text: $document.text, position: $position, messages: $messages, layout: CodeEditor.LayoutConfiguration(showMinimap: Showmap, wrapText: WordWrap)).findNavigator(isPresented: $isShowingFindNavigator).ignoresSafeArea(edges: .bottom)
            //                            .environment(\.codeEditorTheme,
            //                                          colorScheme == .dark ? Theme.dark : Theme.light)
        }.toolbar(){
            ToolbarItem(placement: .topBarTrailing){
                Button(action: {
                    
                    ShowToolbar.toggle()}, label: {
                        if ShowToolbar{
                            Image(systemName: "chevron.up")
                        }
                        else{
                            Image(systemName: "chevron.down")
                        }
                        
                    }).navigationBarTitleDisplayMode(.inline)
            }
        }
    }
}

extension UTType {
    static let textDocument = [UTType.plainText, UTType.html ]
}

func changeFont10 (){
    Theme.fontSize = 10
}

func changeFont13 (){
    Theme.fontSize = 13
}
func changeFont16 (){
    Theme.fontSize = 16
}
func changeFont19 (){
    Theme.fontSize = 19
}
func changeFont22 (){
    Theme.fontSize = 22
}
func changeFont25 (){
    Theme.fontSize = 25
}



extension Theme {

  // Static variable for fontSize
    public static var fontSize: CGFloat = 13.0 {
    didSet {
      updateThemes()
    }
    
  }

  // Method to update themes when fontSize changes
  public static func updateThemes() {
    dark = Theme(colourScheme: .dark,
                 fontName: "SFMono-Medium",
                 fontSize: fontSize,
                 textColour: OSColor(red: 0.87, green: 0.87, blue: 0.88, alpha: 1.0),
                 commentColour: OSColor(red: 0.51, green: 0.55, blue: 0.59, alpha: 1.0),
                 stringColour: OSColor(red: 0.94, green: 0.53, blue: 0.46, alpha: 1.0),
                 characterColour: OSColor(red: 0.84, green: 0.79, blue: 0.53, alpha: 1.0),
                 numberColour: OSColor(red: 0.84, green: 0.79, blue: 0.53, alpha: 1.0),
                 identifierColour: OSColor(red: 0.89, green: 0.89, blue: 0.89, alpha: 1.0),
                 keywordColour: OSColor(red: 0.94, green: 0.51, blue: 0.69, alpha: 1.0),
                 backgroundColour: OSColor(red: 0.16, green: 0.16, blue: 0.18, alpha: 1.0),
                 currentLineColour: OSColor(red: 0.19, green: 0.20, blue: 0.22, alpha: 1.0),
                 selectionColour: OSColor(red: 0.40, green: 0.44, blue: 0.51, alpha: 1.0),
                 cursorColour: OSColor(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0),
                 invisiblesColour: OSColor(red: 0.33, green: 0.37, blue: 0.42, alpha: 1.0))
    
    light = Theme(colourScheme: .light,
                  fontName: "SFMono-Medium",
                  fontSize: fontSize,
                  textColour: OSColor(red: 0.15, green: 0.15, blue: 0.15, alpha: 1.0),
                  commentColour: OSColor(red: 0.45, green: 0.50, blue: 0.55, alpha: 1.0),
                  stringColour: OSColor(red: 0.76, green: 0.24, blue: 0.16, alpha: 1.0),
                  characterColour: OSColor(red: 0.14, green: 0.19, blue: 0.81, alpha: 1.0),
                  numberColour: OSColor(red: 0.14, green: 0.19, blue: 0.81, alpha: 1.0),
                  identifierColour: OSColor(red: 0.15, green: 0.15, blue: 0.15, alpha: 1.0),
                  keywordColour: OSColor(red: 0.63, green: 0.28, blue: 0.62, alpha: 1.0),
                  backgroundColour: OSColor(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0),
                  currentLineColour: OSColor(red: 0.93, green: 0.96, blue: 1.0, alpha: 1.0),
                  selectionColour: OSColor(red: 0.73, green: 0.84, blue: 0.99, alpha: 1.0),
                  cursorColour: OSColor(red: 0.0, green: 0.0, blue: 0.0, alpha: 1.0),
                  invisiblesColour: OSColor(red: 0.84, green: 0.84, blue: 0.84, alpha: 1.0))
  }

  // Initial themes setup
  public static var dark: Theme = Theme(colourScheme: .dark,
                                        fontName: "SFMono-Medium",
                                        fontSize: fontSize,
                                        textColour: OSColor(red: 0.87, green: 0.87, blue: 0.88, alpha: 1.0),
                                        commentColour: OSColor(red: 0.51, green: 0.55, blue: 0.59, alpha: 1.0),
                                        stringColour: OSColor(red: 0.94, green: 0.53, blue: 0.46, alpha: 1.0),
                                        characterColour: OSColor(red: 0.84, green: 0.79, blue: 0.53, alpha: 1.0),
                                        numberColour: OSColor(red: 0.84, green: 0.79, blue: 0.53, alpha: 1.0),
                                        identifierColour: OSColor(red: 0.89, green: 0.89, blue: 0.89, alpha: 1.0),
                                        keywordColour: OSColor(red: 0.94, green: 0.51, blue: 0.69, alpha: 1.0),
                                        backgroundColour: OSColor(red: 0.16, green: 0.16, blue: 0.18, alpha: 1.0),
                                        currentLineColour: OSColor(red: 0.19, green: 0.20, blue: 0.22, alpha: 1.0),
                                        selectionColour: OSColor(red: 0.40, green: 0.44, blue: 0.51, alpha: 1.0),
                                        cursorColour: OSColor(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0),
                                        invisiblesColour: OSColor(red: 0.33, green: 0.37, blue: 0.42, alpha: 1.0))

  public static var light: Theme = Theme(colourScheme: .light,
                                         fontName: "SFMono-Medium",
                                         fontSize: fontSize,
                                         textColour: OSColor(red: 0.15, green: 0.15, blue: 0.15, alpha: 1.0),
                                         commentColour: OSColor(red: 0.45, green: 0.50, blue: 0.55, alpha: 1.0),
                                         stringColour: OSColor(red: 0.76, green: 0.24, blue: 0.16, alpha: 1.0),
                                         characterColour: OSColor(red: 0.14, green: 0.19, blue: 0.81, alpha: 1.0),
                                         numberColour: OSColor(red: 0.14, green: 0.19, blue: 0.81, alpha: 1.0),
                                         identifierColour: OSColor(red: 0.15, green: 0.15, blue: 0.15, alpha: 1.0),
                                         keywordColour: OSColor(red: 0.63, green: 0.28, blue: 0.62, alpha: 1.0),
                                         backgroundColour: OSColor(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0),
                                         currentLineColour: OSColor(red: 0.93, green: 0.96, blue: 1.0, alpha: 1.0),
                                         selectionColour: OSColor(red: 0.73, green: 0.84, blue: 0.99, alpha: 1.0),
                                         cursorColour: OSColor(red: 0.0, green: 0.0, blue: 0.0, alpha: 1.0),
                                         invisiblesColour: OSColor(red: 0.84, green: 0.84, blue: 0.84, alpha: 1.0))
}

// Example of changing the fontSize




struct MyView: View {

    @State
    private var text = NSAttributedString(string: "Type here...")
    
    @StateObject
    var context = RichTextContext()

    var body: some View {
        RichTextEditor(text: $text, context: context)
//        {
            
            // You can customize the native text view here
//        }
        
        .focusedValue(\.richTextContext, context)
    }
}

struct TxtEditViewer:View {
    @Binding var document: TxtFile
    @State private var position: CodeEditor.Position       = CodeEditor.Position()
    @State private var messages: Set<TextLocated<Message>> = Set()
    @Environment(\.colorScheme) private var colorScheme: ColorScheme
    var body: some View {
                    CodeEditor(text: $document.text, position: $position, messages: $messages, layout: CodeEditor.LayoutConfiguration(showMinimap: true, wrapText: true)).ignoresSafeArea(edges: .bottom)
                                    .environment(\.codeEditorTheme,
                                                  colorScheme == .dark ? Theme.dark : Theme.light)
    }
}
