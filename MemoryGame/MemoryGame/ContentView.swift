//
//  ContentView.swift
//  MemoryGame
//
//  Created by Luis Valdez on 3/21/24.
//
// Import the SwiftUI framework in any file you want to use SwiftUI
import SwiftUI

// Define the ContentView structure, which conforms to the View protocol
struct ContentView: View {
    // Define the body property, required by the View protocol
    // Return any object that conforms to the View protocol
    
    let data = (1...9).map { "Item \($0)" }

    let columns = [
        GridItem(.flexible()),
        GridItem(.flexible()),
        GridItem(.flexible()),
        ]
    
    var body: some View {
        ScrollView {
            LazyVGrid(columns: columns, spacing: 20) {
                ForEach(data, id: \.self) { item in
                    Text(item)
                }
            }
            .padding(.horizontal)
        }
        .frame(maxHeight: 700)
    }
}


// Preview the ContentView in the canvas
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
