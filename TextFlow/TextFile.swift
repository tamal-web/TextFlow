//
//  TextFile.swift
//  Editor Master
//
//  Created by Tamal on 05/06/24.
//

import SwiftUI
import UniformTypeIdentifiers
import RichTextKit


struct TxtFile:FileDocument{
    static var readableContentTypes = [UTType.plainText]
    var text = ""
    var fileURL: URL?
    
    init(initialText: String = "") {
            text = initialText
        }
    
    init(configuration: ReadConfiguration) throws {
           if let data = configuration.file.regularFileContents {
               text = String(decoding: data, as: UTF8.self)
           } else {
               throw CocoaError(.fileReadCorruptFile)
           }
       }
    
       func fileWrapper(configuration: WriteConfiguration) throws -> FileWrapper {
           let data = Data(text.utf8)
           return FileWrapper(regularFileWithContents: data)
       }

    
}





struct TextFile: FileDocument {
   
    
    init(initialText: String = "") {
           text = NSAttributedString(string: initialText)
       }
    
    var text: NSAttributedString
    
    static var readableContentTypes = [UTType.rtf]

    
    init(
        configuration: ReadConfiguration
    ) throws {
        guard
            let data = configuration.file.regularFileContents
        else {
            throw CocoaError(.fileReadCorruptFile)
        }
        let text = try NSAttributedString(data: data, format: .rtf)
        self.text = text
    }
       
    
    func fileWrapper(
        configuration: WriteConfiguration
    ) throws -> FileWrapper {
        let data = try text.richTextData(for: .rtf)
        return FileWrapper(regularFileWithContents: data)
    }
    
 
    }

//struct TxtFile:FileDocument{
//
//}
