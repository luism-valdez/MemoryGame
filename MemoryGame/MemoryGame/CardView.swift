//
//  CardView.swift
//  MemoryGame
//
//  Created by Luis Manuel Valdez on 3/21/24.
//

import SwiftUI

struct CardView: View {
    
    @Binding var card: Card
    var isSelected: Bool
//    let card: Card
    
//    let lightGray = Color(red: 0.5, green: 0.5, blue: 0.5, opacity: 0.15)
    
    @State var isShowingBlank = true
    
    var body: some View {
        ZStack{
            
            // Card background
            RoundedRectangle(cornerRadius: 10.0)
                .fill(isSelected ? Color(red: 0.5, green: 0.5, blue: 0.5, opacity: 0.15) : .blue)
                .frame(width: 115, height: 167)
                .padding()
                .rotation3DEffect(
                    .degrees(card.isShowingBlank ? 0 : 180), axis: (x: 0.0, y: 1.0, z: 0.0))
            
            // Card text
            Text(card.isShowingBlank ? "" : card.emoji)
                .font(.title)
                .foregroundStyle(.white)
                .padding()
        }
        .frame(width: 115, height: 167)
//        .onTapGesture {
//            isShowingBlank.toggle()
            
        }
}


// Card data model
struct Card: Identifiable {
//    let blank: String
    let id = UUID()
    let emoji: String
    var isShowingBlank = true
    var isMatched = false
    
    static let mockedCards = [
            Card(emoji: "🦊"),
            Card(emoji: "🐶"),
            Card(emoji: "🏃🏼‍♂️"),
            Card(emoji: "✈️"),
            Card(emoji: "🚠"),
            Card(emoji: "🍊"),
            Card(emoji: "🚴‍♂️"),
            Card(emoji: "🗿"),
            Card(emoji: "🌉"),
            Card(emoji: "🇲🇽"),
            Card(emoji: "🦊"),
            Card(emoji: "🐶"),
            Card(emoji: "🏃🏼‍♂️"),
            Card(emoji: "✈️"),
            Card(emoji: "🚠"),
            Card(emoji: "🍊"),
            Card(emoji: "🚴‍♂️"),
            Card(emoji: "🗿"),
            Card(emoji: "🌉"),
            Card(emoji: "🇲🇽")
        ]
}


//struct CardView_Previews: PreviewProvider {
//    static var previews: some View {
//
//        CardView(
//            card: <#Binding<Card>#>, isSelected: <#Bool#>)
//    }
//}

