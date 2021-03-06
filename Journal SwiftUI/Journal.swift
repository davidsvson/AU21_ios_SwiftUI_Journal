//
//  Journal.swift
//  Journal SwiftUI
//
//  Created by David Svensson on 2021-12-17.
//

import Foundation

class Journal : ObservableObject  {
    @Published var entries = [JournalEntry]()
    
    init() {
        addMockData()
    }
    
    func update(entry: JournalEntry, with content: String) {
         if let index = entries.firstIndex(of: entry) {
             entries[index].content = content
        }
    }
    
    
    func addMockData() {
        entries.append(JournalEntry(content: "Dag 1"))
        entries.append(JournalEntry(content: "Jag åt mat"))
        entries.append(JournalEntry(content: "Sov mest"))
        entries.append(JournalEntry(content: "Jobbade hårt"))
        entries.append(JournalEntry(content: "Programmerade hela dagen"))
    }
}
