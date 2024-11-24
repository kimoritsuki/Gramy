//
//  ContentView.swift
//  Gramy
//
//  Created by Lacour Hugo on 24/11/2024.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        TabView {
            GrammarView()
                .tabItem {
                    Label("Grammaire", systemImage: "book.fill")
                }
            
            StoryView()
                .tabItem {
                    Label("Histoire", systemImage: "book.pages.fill")
                }

            SettingsView()
                .tabItem {
                    Label("Settings", systemImage: "gearshape")
                }
        }
    }
}

#Preview {
    ContentView()
}
