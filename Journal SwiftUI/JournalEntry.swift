//
//  JournalEntry.swift
//  Journal SwiftUI
//
//  Created by David Svensson on 2021-12-17.
//

import Foundation

struct JournalEntry  : Identifiable {
    var id = UUID()
    
    var content : String
    var date : Date = Date()
}


