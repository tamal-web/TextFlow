//
//  TextFile.swift
//  TextFlow
//
//  Created by Tamal on 05/06/24.
//

import SwiftUI
import UniformTypeIdentifiers



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

