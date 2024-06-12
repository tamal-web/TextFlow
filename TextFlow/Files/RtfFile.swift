
import SwiftUI
import UniformTypeIdentifiers

struct RtfFile: FileDocument {
    static var readableContentTypes = [UTType.rtf]
   
    init(initialText: String = "") {
           text = NSAttributedString(string: initialText)
       }

    var text: NSAttributedString

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
