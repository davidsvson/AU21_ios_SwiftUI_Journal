//
//  ContentView.swift
//  Journal SwiftUI
//
//  Created by David Svensson on 2021-12-17.
//

import SwiftUI

struct ContentView: View {
    @StateObject var journal = Journal()
  
    var body: some View {
        NavigationView {
            List() {
                ForEach(journal.entries) { entry in
                    NavigationLink(destination: JournalEntryView(entry: entry)) {
                        RowView(entry: entry)
                    }
                }
                .onDelete(perform: { indexSet in
                    journal.entries.remove(atOffsets: indexSet)
                })
            }
            .navigationTitle("Journal")
            .navigationBarItems(trailing: NavigationLink(destination: JournalEntryView()) {
                Image(systemName: "plus.circle")
            })
        }.navigationViewStyle(.stack)
    }
}


struct RowView : View {
    var entry : JournalEntry
    
    var date : String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateStyle = .medium
        
        return dateFormatter.string(from: entry.date)
    }
    
    var body: some View {
        HStack {
            Text(date)
            Spacer()
            Text(entry.content.prefix(7) + "...")
        }
    }
}




struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        //RowView(entry: JournalEntry(content: "Vi testar med en dags anteckning"))
        ContentView()
    }
}
