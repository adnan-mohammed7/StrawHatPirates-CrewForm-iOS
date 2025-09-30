//
//  ContentView.swift
//  Assignment-2
//
//  Created by user278021 on 9/29/25.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        TabView{
            NavigationStack { Part1View() }
                .tabItem { Label("Application", systemImage: "doc.text") }
            
            NavigationStack { Part2View() }
                .tabItem { Label("Profile", systemImage: "person") }
        }
    }
}

#Preview {
    ContentView()
}
