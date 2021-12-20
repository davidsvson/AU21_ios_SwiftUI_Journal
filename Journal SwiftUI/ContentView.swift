//
//  ContentView.swift
//  Journal SwiftUI
//
//  Created by David Svensson on 2021-12-17.
//

import SwiftUI

struct ContentView: View {
    @EnvironmentObject var journal : Journal
    
    @State var showInfo : Bool = false
    
    var body: some View {
        NavigationView {
            VStack {
            
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
                
                Button(action: {
                    showInfo = true
                }, label: {
                    Text("Open sheet")
                })
                    .sheet(isPresented: $showInfo) {
                        SheetView(isPresented: $showInfo)
                    }
                
            }
        }.navigationViewStyle(.stack)
    }
}

struct SheetView : View {
    @Binding var isPresented : Bool
    
    var body: some View {
        Button(action: {
            isPresented = false
        }, label: {
            Text("close")
        })
    }
    
}

struct RowView : View {
    var entry : JournalEntry
    
    var body: some View {
        HStack {
            Text(entry.date)
            Spacer()
            Text(entry.content.prefix(7) + "...")
        }
    }
}


//struct ContentView_Previews: PreviewProvider {
//    static var previews: some View {
//        //RowView(entry: JournalEntry(content: "Vi testar med en dags anteckning"))
//        ContentView()
//    }
//}
