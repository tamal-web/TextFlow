
import SwiftUI
import CodeEditorView
import LanguageSupport
import UniformTypeIdentifiers
//import

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
