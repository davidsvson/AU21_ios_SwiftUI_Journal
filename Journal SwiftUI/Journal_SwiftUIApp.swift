//
//  Journal_SwiftUIApp.swift
//  Journal SwiftUI
//
//  Created by David Svensson on 2021-12-17.
//

import SwiftUI

@main
struct Journal_SwiftUIApp: App {

    @StateObject var journal = Journal()
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(journal)
        }
    }
}
