//
//  Editor_MasterApp.swift
//  Editor Master
//
//  Created by Tamal on 05/06/24.
//

import SwiftUI
import UniformTypeIdentifiers

@main
struct Editor_MasterApp: App {
    @AppStorage("index") var index = 0
    
    var body: some Scene {
        
        Group{

                DocumentGroup(newDocument: TextFile()){
                    file in
                   
                        ContentView(document:file.$document, fileURL: file.fileURL)
                    
                    
                    
                    }
                    
                    DocumentGroup(newDocument: TxtFile()){
                        file in TxtEditViewer(document: file.$document)
                    }
            
            
           
        }
    
    }
}
 
