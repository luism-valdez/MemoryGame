//
//  ContentView.swift
//  MemoryGame
//
//  Created by Luis Manuel Valdez on 3/21/24.
//
// Import the SwiftUI framework in any file you want to use SwiftUI
import SwiftUI

// Define the ContentView structure, which conforms to the View protocol
struct ContentView: View {
    // Define the body property, required by the View protocol
    // Return any object that conforms to the View protocol

    let columns = [
        GridItem(.flexible()),
        GridItem(.flexible()),
        GridItem(.flexible()),
        ]
    //State properties
    @State private var cards: [Card] = Card.mockedCards.shuffled() // Initialize and shuffle the cards
    @State private var selectedIndices: [Int] = [] // Track indices of selected cards
//    @State private var cardsSelected: Int? // <-- A state property to which the index of the card that has been turned over
//    @State private var cardsMatched: [Card] = [] // Store cards removed from cards array
    
    var body: some View {
        VStack {
            Button("Reset Game") { // <-- Reset button with title and action
                cards = Card.mockedCards.shuffled() // <-- Reset the cards array and shuffles
                selectedIndices = [] // <-- set selectedIndices to empty after reset
//                cards[cards.].isMatched = false // <--
            }
            ScrollView {
                LazyVGrid(columns: columns, spacing: 10) {
                    //                ForEach(0..<cards.count, id: \.self) { index in
                    ForEach(cards.indices, id: \.self) {index in
                        //                    CardView(card: cards[index])
                        CardView(card: $cards[index], isSelected: selectedIndices.contains(index))
                            .onTapGesture {
                                selectCard(index)
                            }
                    }
                }
                .padding()
            }
            .frame(maxHeight: 700)
        }
    }

func selectCard(_ index: Int) {
        // Only allow selecting cards if less than two are already selected
    withAnimation {
        cards[index].isShowingBlank.toggle()}
        if selectedIndices.count < 2 && !selectedIndices.contains(index) {
            selectedIndices.append(index)

            // If two cards are selected, check for a match
            if selectedIndices.count == 2 {
                checkForMatch()
            }
        }
    }

func checkForMatch() {
       let firstIndex = selectedIndices[0]
       let secondIndex = selectedIndices[1]

       if cards[firstIndex].emoji == cards[secondIndex].emoji {
           // Match found, keep the cards and update UI
           cards[firstIndex].isMatched = true
           cards[secondIndex].isMatched = true

           // Perform any actions for a match (e.g., show a message)
           print("Match found!")

           // Reset selectedIndices after a short delay
           DispatchQueue.main.asyncAfter(deadline: .now() + 1.0) {
               withAnimation {
                   selectedIndices.removeAll()
               }
           }
       } else {
           // No match, flip cards back and update UI
           DispatchQueue.main.asyncAfter(deadline: .now() + 1.0) {
               withAnimation {
                   cards[firstIndex].isShowingBlank.toggle()
                   cards[secondIndex].isShowingBlank.toggle()
                   selectedIndices.removeAll()
               }
           }

           // Perform any actions for no match (e.g., show a message)
           print("No match!")
       }
   }
}



// Preview the ContentView in the canvas
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
