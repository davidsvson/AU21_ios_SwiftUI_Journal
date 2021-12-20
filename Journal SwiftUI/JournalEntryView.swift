//
//  JournalEntryView.swift
//  Journal SwiftUI
//
//  Created by David Svensson on 2021-12-17.
//

import SwiftUI

struct JournalEntryView: View {
    
    @EnvironmentObject var journal : Journal
    var entry : JournalEntry? = nil
    private let defaultContent = "Today I..."
    @Environment(\.presentationMode) var presentationMode
    
    @State var content : String = ""
    
    var body: some View {
        VStack {
            if let entry = entry {
                Text(entry.date)
            }
            TextEditor(text: $content)
                .onTapGesture{
                   clearText()
                }
        }
        .onAppear(perform: setContent)
        .navigationBarItems(trailing: Button("Save") {
            saveEntry()
            presentationMode.wrappedValue.dismiss()
        })
    }
    
    private func setContent() {
        if let entry = entry {
            content = entry.content
        } else {
            content = defaultContent
        }
    }
    
    private func clearText() {
        if (entry == nil) {
            content = ""
        }
    }
    
    
    private func saveEntry() {
        
        if let entry = entry {
            // uppadatera en gammal anteckning
            journal.update(entry: entry, with: content)
//            if let index = journal.entries.firstIndex(of: entry) {
//                journal.entries[index].content = content
//            }
            
            
        } else {
            // skapa ny dagboksanteckning
            let newEntry = JournalEntry(content: content)
            journal.entries.append(newEntry)
        }
    }
    
    
    
}

//struct JournalEntryView_Previews: PreviewProvider {
//    static var previews: some View {
//        JournalEntryView()
//    }
//}
