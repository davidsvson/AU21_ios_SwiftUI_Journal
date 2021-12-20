//
//  JournalEntryView.swift
//  Journal SwiftUI
//
//  Created by David Svensson on 2021-12-17.
//

import SwiftUI

struct JournalEntryView: View {
    var entry : JournalEntry? = nil
    
    var body: some View {
        if let entry = entry {
            Text(entry.content)
        } else {
            Text("nytt entry")
        }       
    }
}

//struct JournalEntryView_Previews: PreviewProvider {
//    static var previews: some View {
//        JournalEntryView()
//    }
//}
